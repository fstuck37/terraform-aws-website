output "website_endpoint" {
  value = aws_s3_bucket.website.website_endpoint
}

output "www_website_endpoint" {
  value = { for k,v in aws_s3_bucket.redirects : k => v.website_endpoint }
}