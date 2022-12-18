/* Provider for TLS */
terraform {
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "~> 2.0"
    }
  }
}

provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

/* Main S3 Bucket for Main Site */
resource "aws_s3_bucket" "website" {
  bucket        = var.main_site
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "${aws_s3_bucket.website.arn}/*"
            ]
        }
    ]
}
EOF
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.bucket

  error_document {
    key = var.error_document
  }

  index_document {
    suffix = var.index_document
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.website.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

/* www redirect */
resource "aws_s3_bucket" "redirects" {
  for_each = { for s in var.redirects : s => s }
    bucket = each.value
}

resource "aws_s3_bucket_website_configuration" "redirects" {
  for_each = { for s in var.redirects : s => s }
    bucket = aws_s3_bucket.redirects[each.key].bucket
    redirect_all_requests_to {
      host_name = "${var.main_site}"
    }
}

resource "aws_s3_bucket_policy" "redirects" {
  for_each = { for s in var.redirects : s => s }
  bucket = aws_s3_bucket.redirects[each.key].id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${each.key}/*"
            ]
        }
    ]
}
EOF
}

/* Add files to bucket */
resource "aws_s3_object" "files" {
  for_each = fileset(var.file_path, var.pattern)
    bucket       = aws_s3_bucket.website.id
    key          = each.value
    source       = "./files/${each.value}"
    etag         = filemd5("./files/${each.value}")
    content_type = lookup(var.context_types, element(split(".",each.value), length(split(".",each.value))-1 ), null)
}

/* Certificate */
data "aws_route53_zone" "base_domain" {
  count = var.route53_zone == "none" ? 0 : 1
  name  = var.route53_zone
}

resource "tls_private_key" "private_key" {
  count       = var.route53_zone == "none" ? 0 : 1
  algorithm   = var.tls_algorithm
  ecdsa_curve = var.tls_ecdsa_curve
  rsa_bits    = var.tls_rsa_bits
}

resource "acme_registration" "registration" {
  count       = var.route53_zone == "none" ? 0 : 1
  account_key_pem = tls_private_key.private_key[0].private_key_pem
  email_address   = var.acme_registration_email_address
}

resource "acme_certificate" "certificate" {
  count       = var.route53_zone == "none" ? 0 : 1
  account_key_pem           = acme_registration.registration[0].account_key_pem
  common_name               = data.aws_route53_zone.base_domain[0].name
  subject_alternative_names = ["*.${data.aws_route53_zone.base_domain[0].name}"]

  dns_challenge {
    provider = "route53"

    config = {
      AWS_HOSTED_ZONE_ID = data.aws_route53_zone.base_domain[0].zone_id
    }
  }
}

resource "aws_acm_certificate" "certificate" {
  count             = var.route53_zone == "none" ? 0 : 1
  certificate_body  = acme_certificate.certificate[0].certificate_pem
  private_key       = acme_certificate.certificate[0].private_key_pem
  certificate_chain = acme_certificate.certificate[0].issuer_pem
}

// CloudFront Setup
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  count = var.route53_zone == "none" ? 0 : 1
}

resource "aws_cloudfront_distribution" "prod_distribution" {
  count = var.route53_zone == "none" ? 0 : 1
  origin {
    domain_name = aws_s3_bucket.website.bucket_regional_domain_name
    origin_id = "S3-${aws_s3_bucket.website.bucket}"
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity[0].cloudfront_access_identity_path
    }
  }
  
  default_root_object = var.index_document
  enabled = true
  is_ipv6_enabled = true
  aliases = [var.main_site]

  default_cache_behavior {
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = "S3-${aws_s3_bucket.website.bucket}"
    
    forwarded_values {
      query_string = true
       cookies {
          forward = "none"
       }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
  
  price_class = var.aws_cloudfront_price_class
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  
  # SSL certificate for the service.
  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.certificate[0].arn
    ssl_support_method = "sni-only"
  }
}

// DNS Setup
resource "aws_route53_record" "main_record" {
  count = var.route53_zone == "none" ? 0 : 1
  zone_id = data.aws_route53_zone.base_domain[0].zone_id
  name    = var.main_site
  type    = "CNAME"
  ttl     = 300
  records = [aws_cloudfront_distribution.prod_distribution[0].domain_name]
}
