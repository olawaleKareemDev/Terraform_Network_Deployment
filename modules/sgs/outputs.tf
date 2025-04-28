output "db_sg_id" {
  value = aws_security_group.allow_database.id
}

output "backend_sg_id" {
  value = aws_security_group.allow_backend.id
}

output "frontend_sg_id" {
  value = aws_security_group.allow_frontend.id
}