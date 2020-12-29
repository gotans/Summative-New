variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default = "10.1.0.0/16"
}
variable "cidr_subnet_pub1" {
  description = "CIDR block for the subnet"
  default = "10.1.1.0/24"
}

variable "cidr_subnet_pub2" {
  description = "CIDR block for the subnet"
  default = "10.1.2.0/24"
}

variable "cidr_subnet_pub3" {
  description = "CIDR block for the subnet"
  default = "10.1.3.0/24"
}

variable "cidr_subnet_pri1" {
  description = "CIDR block for the subnet"
  default = "10.1.4.0/24"
}

variable "cidr_subnet_pri2" {
  description = "CIDR block for the subnet"
  default = "10.1.5.0/24"
}

variable "cidr_subnet_pri3" {
  description = "CIDR block for the subnet"
  default = "10.1.6.0/24"
}
variable "availability_zone" {
  description = "availability zone to create subnet"
  default = "us-east-2a"
}
variable "environment_tag" {
  description = "Environment tag"
  default = "Production"
}

provider "aws" {
  profile = var.profile
  region  = var.region
  alias = "region-default"
}


variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-0cf31d971a3ca20d6"
}

variable "public_key_path" {
  description = "Public key path"
  default = "C:/Terraform/Summative/live/networking/region-key-pair.pub"
}