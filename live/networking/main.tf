provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "../../modules/network"
  
}

output "networks" {
  value = module.vpc
}