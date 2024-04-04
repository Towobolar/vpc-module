provider "aws" {
  region = "eu-west-2"
}

module "my_vpc" {
  source                    = "../module/vpc"
  vpc_cidr_block            = var.vpc_cidr_block
  tag_vpc_name              = var.tag_vpc_name
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  tag_public_subnet_name    = var.tag_public_subnet_name
  az_public_subnet          = var.az_public_subnet
  private_subnet_cidr_block = var.private_subnet_cidr_block
  tag_private_subnet_name   = var.tag_private_subnet_name
  az_private_subnet         = var.az_private_subnet
  tag_internet_gateway      = var.tag_internet_gateway
  tag_public_route_table    = var.tag_public_route_table
}