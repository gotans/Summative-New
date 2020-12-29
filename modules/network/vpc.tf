#creating VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
      Name = "summative_vpc"
  }
}

#creating public subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet_pub1
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone
  
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet_pub2
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone
 
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet_pub3
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone
 
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet_pri1
  map_public_ip_on_launch = "false"
  availability_zone = var.availability_zone
 
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet_pri2
  map_public_ip_on_launch = "false"
  availability_zone = var.availability_zone
  
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet_pri3
  map_public_ip_on_launch = "false"
  availability_zone = var.availability_zone
 
}
