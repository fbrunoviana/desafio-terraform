output "ec2_dns" {
  value = aws_instance.web.public_dns
}
output "ec2_ip" {
  value = aws_instance.web.public_ip
}

output "db_ip_address" {
  value = aws_db_instance.default.endpoint
}