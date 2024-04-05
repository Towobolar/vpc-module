resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.tag_vpc_name
  }
}

data "aws_availability_zones" "availiable_zones" {
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = data.aws_availability_zone.availiable_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = var.tag_public_subnet_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_block
  availability_zone       = data.aws_availability_zone.availiable_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = var.tag_private_subnet_name
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.tag_internet_gateway
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }


  tags = {
    Name = var.tag_public_route_table
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"

  }
}

resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_eip" "elastic_ip" {
  domain = "my vpc"


  tags = {
    Name = "Nat eip"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.private_app_server.id
  allocation_id = aws_eip.elastic_ip.id
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.private_subnet.id

  tags = {
    Name = "private app gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet-gw]
}

resource "aws_security_group" "ec2_security_group" {
  name        = var.sg_name
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}