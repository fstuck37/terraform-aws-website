# terraform-aws-website
Host a static website in S3.


Hosting a Static Website in AWS S3
=============

This module deploys an AWS S3 Bucket for hosting a Website.
It will also deploy one or more S3 buckets for redirect sites such as redirecting www.geek37.net to geek37.com.

The goal of this project is to provide a streamlined, simple Terraform script to deploy a website.

Example
------------
```
module "website" {
  source     = "git::https://github.com/fstuck37/terraform-aws-website.git"
  main_site  = "geek37.com"
  file_path  = "./files/"
}

module "website" {
  source     = "git::https://github.com/fstuck37/terraform-aws-website.git"
  main_site  = "geek37.com"
  file_path  = "./files/"
  redirects  = ["www.geek37.net", "www.geek37.com", "geek37.com"]
}
```

Argument Reference
------------
   * **main_site** - Required: The site to host in AWS for example www.geek37.com or geek37.com. Must be lowercase and less than or equal to 37 characters in length.
   * **buket_prefix** - Optional: True specifies to use the bucket_prefix instead of the bucket parameter when creating the S3 buckets. This ensures a unique name. You can override this to use bucket and ensure the bucket name is the name as the sites or redirect entries.
   * **file_path** - Required: The path to the files and folders to upload to S3. These should be in a folder by themselves as everything in the folder will be uploaded to S3 and publicly accessible.
   * **pattern** - Optional: The path to the files and folders to upload to S3. These should be in a folder by themselves as everything in the folder will be uploaded to S3 and publicly accessible. Defaults to **
   * **redirects** - Optional : The sites that will redirect to the main site. For example www.geek37.com redirects to main site geek37.com.
   * **index_document** - Optional : the default file to load defaults to index.html
   * **error_document** - Optional : the default error file to load when a file is not found. Defaults to error.html
   * **context_types** - Optional : list of file extensions and their respective context types.

Output Reference
------------
* **website_endpoint** - Outputs the DNS entry for the main website. This should be used for the CNAME for the site.
* **www_website_endpoint** - Outputs the DNS entry for each of the Redirect website. These should be used for the CNAME for the site.
