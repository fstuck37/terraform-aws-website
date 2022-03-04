variable "main_site" {
  description = "Required: The site to host in AWS for example www.geek37.com or geek37.com. Must be lowercase and less than or equal to 37 characters in length."
  type    = string
}

variable "file_path" {
  description = "Required: The path to the files and folders to upload to S3. These should be in a folder by themselves as everything in the folder will be uploaded to S3 and publicly accessible."
  type    = string
}

variable "pattern" {
  description = "Optional: The path to the files and folders to upload to S3. These should be in a folder by themselves as everything in the folder will be uploaded to S3 and publicly accessible. Defaults to **"
  type    = string
  default = "**"
}

variable "redirects" {
  description = "Optional : The sites that will redirect to the main site. For example www.geek37.com redirects to main site geek37.com."
  type    = list(string)
  default = []
}

variable "index_document" {
  description = "Optional : the default file to load defaults to index.html"
  type    = string
  default = "index.html"
}

variable "error_document" {
  description = "Optional : the default error file to load when a file is not found. Defaults to error.html"
  type    = string
  default = "error.html"
}
