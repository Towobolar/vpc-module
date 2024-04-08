output "ec2_sg" {
  description = "id of the security group"
  value       = aws_security_group.ec2_sg.id
}