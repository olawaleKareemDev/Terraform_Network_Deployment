output "public_subnets_frontend" {
  value = aws_subnet.public_subnets_frontend
}

output "private_subnets_backend" {
  value = aws_subnet.private_subnets_backend
}

output "private_subnets_database" {
  value = aws_subnet.private_subnets_database
}