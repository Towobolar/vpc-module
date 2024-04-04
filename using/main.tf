provider "aws" {
  region = "eu-west-2"
}

module "my_vpc" {
  source         = "../module/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  tag_vpc_name   = var.tag_vpc_name
}