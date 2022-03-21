local {
 resource = [for i in var.redirects : "arn:aws:s3:::${i}/*"]
}

/* Main S3 Bucket for Main Site */
resource "aws_s3_bucket" "website" {

  bucket        = !var.buket_prefix ? var.main_site : null
  bucket_prefix = var.buket_prefix ? var.main_site : null
  acl           = "public-read"

  website {
    index_document = var.index_document
    error_document = var.error_document
  }

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
                "arn:aws:s3:::${var.main_site}/*"
            ]
        }
    ]
}
EOF
}

/* www redirect */
resource "aws_s3_bucket" "redirects" {
  for_each = { for i in ["${var.main_site}-r"] : i => var.redirects
             if length(var.redirects)>0 }
    bucket_prefix = each.key
    acl    = "public-read"
    website {
      redirect_all_requests_to = "http://${var.main_site}"
    }
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
            "Resource": ${local.resource}
        }
    ]
}
EOF
}

/*
resource "aws_s3_bucket" "redirects" {
  for_each = { for s in var.redirects : s => s }
    bucket        = !var.buket_prefix ? each.value : null
    bucket_prefix = var.buket_prefix ? each.value : null
 
    acl    = "public-read"
    website {
      redirect_all_requests_to = "http://${var.main_site}"
    }

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
                "arn:aws:s3:::${each.value}/*"
            ]
        }
    ]
}
EOF
}
*/


resource "aws_s3_bucket_object" "files" {
  for_each = fileset(var.file_path, var.pattern)
    bucket       = aws_s3_bucket.website.id
    key          = each.value
    source       = "./files/${each.value}"
    etag         = filemd5("./files/${each.value}")
    content_type = lookup(var.context_types, element(split(".",each.value), length(split(".",each.value))-1 ), null)
}
