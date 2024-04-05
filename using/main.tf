provider "aws" {
  region = "eu-west-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


module "vpc" {
  source                    = "../module/vpc"
  vpc_cidr_block            = var.vpc_cidr_block
  tag_vpc_name              = var.tag_vpc_name
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  tag_public_subnet_name    = var.tag_public_subnet_name
  private_subnet_cidr_block = var.private_subnet_cidr_block
  tag_private_subnet_name   = var.tag_private_subnet_name
  tag_internet_gateway      = var.tag_internet_gateway
  tag_public_route_table    = var.tag_public_route_table
  sg_name                   = var.sg_name


}

module "ec2" {
  source                           = "../module/ec2"
  ami_public_web_server            = var.ami_public_web_server
  instance_type_public_web_server  = var.ami_public_web_server
  tag_public_web_server            = var.ami_public_web_server
  ami_private_app_server           = var.ami_private_app_server
  instance_type_private_app_server = var.ami_private_app_server
  tag_private_app_server           = var.tag_private_app_server
  subnet_id_public_web_server      = data.aws_subnet.public_subnet.id
  subnet_id_private_app_server     = data.aws_subnet.private_app_server.id
}