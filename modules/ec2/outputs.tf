output "frontend_instance_ips" {
  value = data.aws_instances.asg_frontend_instances.public_ips
}


output "backend_instance_ips" {
  value = data.aws_instances.asg_backend_instances.private_ips
}