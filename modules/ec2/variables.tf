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

variable "subnet_id_public_web_server" {
  description = "subnet for public web server"
  type        = string
}

variable "subnet_id_private_app_server" {
  description = "subnet for private app server"
  type        = string
}