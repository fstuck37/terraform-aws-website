/* Main S3 Bucket for Main Site */
resource "aws_s3_bucket" "website" {

  bucket        = var.main_site
  acl           = "public-read"

  website {
    index_document = var.index_document
    error_document = var.error_document
  }
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

/* www redirect */
resource "aws_s3_bucket" "redirects" {
  for_each = { for s in var.redirects : s => s }
    bucket        = each.value
    acl    = "public-read"
    website {
      redirect_all_requests_to = "http://${var.main_site}"
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

resource "aws_s3_bucket_object" "files" {
  for_each = fileset(var.file_path, var.pattern)
    bucket       = aws_s3_bucket.website.id
    key          = each.value
    source       = "./files/${each.value}"
    etag         = filemd5("./files/${each.value}")
    content_type = lookup(var.context_types, element(split(".",each.value), length(split(".",each.value))-1 ), null)
}