output "guelo" {
  value = aws_instance.guelo.public_ip
  description = "Mostra o ip publico do guelo"
}