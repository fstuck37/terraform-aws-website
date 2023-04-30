output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}

output "redirect_endpoints" {
  value = { for k,v in aws_s3_bucket.redirects : k => v.website_endpoint }
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.website.bucket_regional_domain_name
}

output "bucket" {
  value = aws_s3_bucket.website.bucket
}