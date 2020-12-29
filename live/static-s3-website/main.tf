provider "aws" {
  region = "us-east-2"
}

module "s3-website" {
  source = "../../modules/s3-website"

  bucket_name = "s3-website-anshulg"

}

output "website_endpoint" {
  value = module.s3-website.website_endpoint
}
