resource "aws_security_group" "ec2_sg" {
  name   = var.sg_name
  vpc_id            = aws_vpc.my_vpc.id


  ingress {
    protocol  = "http"
    self      = true
    from_port = 80
    to_port   = 80
  }

  ingress {
    protocol  = "tcp"
    self      = true
    from_port = 22
    to_port   = 22
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}