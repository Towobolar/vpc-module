# ec2 instance 

resource "aws_instance" "public_web_server" {
  ami           = var.ami_public_web_server
  instance_type = var.instance_type_public_web_server
  subnet_id     = data.aws_subnet_id.public_subnet
  key_name      = aws_key_pair.instance_key.id

  tags = {
    Name = var.tag_public_web_server
  }
}

resource "aws_instance" "private_app_server" {
  ami           = var.ami_private_app_server
  instance_type = var.instance_type_private_app_server
  subnet_id     = data.aws_subnet_id.tag_private_app_server
  key_name      = aws_key_pair.instance_key.id

  tags = {
    Name = var.tag_private_app_server
  }
}

resource "aws_key_pair" "instance_key" {
  key_name   = "demo-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDuNDjqNLmFDfpAfLyk0xJI/mnsQJY7CBxcAqMOHnEUkRjdVtwDCGDadnG77iZjI0sNpVXqkZacSaxx684xGdy0tWihuixP81Kn+Zsgdwi+Mx4WjPfgT2s27lba2kZhJC0pEr5hzHEJWNwX1aOvQjGzIGr+898y6gwp/DK3cggFEQ/jNBCS76NYUFODQGpR4Wiw9cOo1B1TiGe0UW3H183+h/q1Fv3yGvFm6J0iQC83soT5hcskmuoDbstJF/y5jd7ghcQB+v67C3IWuC9oKnq+mte0oRg7+G7NnGsv1S3yBQobs8AuazOTPUmmQ/q/ThSClqwPUTd3ajfAd2sqz73+04ZDO+oZJsdYUUTl+rPzH3Qsn645iD+NJhK+G9Y8Kq6NWs2x+C2ikIPof8QIL/GfOfAk4TNi5DwCNTnhEJthPug6Zw7MhsySNjR5B5lin2Pa9iAmKLQ5XTNDvLs+gNqeEVWoBoYvM78CEh4A7+Q2Q224DvMeKrpgiVqUdI02Ht0= abbey@TOWOBOLA"
}