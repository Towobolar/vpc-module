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
  source                    = "../modules/vpc"
  vpc_cidr_block            = var.vpc_cidr_block
  tag_vpc_name              = var.tag_vpc_name
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  tag_public_subnet_name    = var.tag_public_subnet_name
  private_subnet_cidr_block = var.private_subnet_cidr_block
  tag_private_subnet_name   = var.tag_private_subnet_name
  tag_internet_gateway      = var.tag_internet_gateway
  tag_public_route_table    = var.tag_public_route_table
  sg_name                   = var.sg_name
  az_private_subnet         = var.az_private_subnet
  az_public_subnet          = var.az_public_subnet
}

module "ec2" {
  source                           = "../modules/ec2"
  ami_public_web_server            = var.ami_public_web_server
  instance_type_public_web_server  = var.instance_type_public_web_server
  tag_public_web_server            = var.tag_public_web_server
  ami_private_app_server           = var.ami_private_app_server
  instance_type_private_app_server = var.instance_type_private_app_server
  tag_private_app_server           = var.tag_private_app_server
  subnet_id_public_web_server      = module.vpc.public_subnet_id
  subnet_id_private_app_server     = module.vpc.private_subnet_id
}