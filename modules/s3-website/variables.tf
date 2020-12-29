variable "profile" {
  type = string
  default = "default"
}


variable "region" {
    type = string
    default = "us-east-2"
  
}

variable "bucket_name" {
  description = "The name of the AWS S3 bucket this website will be published to."
}