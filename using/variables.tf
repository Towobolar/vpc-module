variable "vpc_cidr_block" {
  description = "vpc cidr block"
  type        = string
}

variable "tag_vpc_name" {
  description = "tag name for vpc"
  type        = string
}

variable "public_subnet_cidr_block" {
  description = "public subnet cidr block"
  type        = string
}

variable "tag_public_subnet_name" {
  description = "tag for public subnet"
  type        = string
}

variable "az_public_subnet" {
  description = "availability zone for public subnet"
  type        = string
}

variable "private_subnet_cidr_block" {
  description = "private subnet cidr block"
  type        = string
}

variable "tag_private_subnet_name" {
  description = "tag for private subnet"
  type        = string
}

variable "az_private_subnet" {
  description = "availability zone for private subnet"
  type        = string
}

variable "tag_internet_gateway" {
  description = "internet gateway"
  type        = string
}

variable "tag_public_route_table" {
  description = "public route table tag"
  type        = string
}

variable "ami_public_web_server" {
  description = "ami for public web server"
  type        = string
}

variable "instance_type_public_web_server" {
  description = "instance type of public web server"
  type        = string
}

variable "tag_public_web_server" {
  description = "tag for public web server"
  type        = string
}

variable "ami_private_app_server" {
  description = "ami for private app server"
}

variable "instance_type_private_app_server" {
  description = "instance type of private app server"
  type        = string
}

variable "tag_private_app_server" {
  description = "tag for private app server"
  type        = string
}

variable "sg_name" {
  description = "sg name"
  type        = string
}