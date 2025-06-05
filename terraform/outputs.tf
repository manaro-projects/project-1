output "instance_public_dns" {
  description = "The Public DNS of instance"
  value       = aws_instance.public_instance.public_dns
}
