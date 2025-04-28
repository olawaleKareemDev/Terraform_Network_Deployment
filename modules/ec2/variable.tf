variable "public_subnets_frontend" {
  description = "Public subnet frontend"
}

variable "private_subnets_backend" {
  description = "Private subnet backend"
}


variable "public_subnets_frontend_sg" {
  description = "Public subnet frontend sg"
}

variable "private_subnets_backend_sg" {
  description = "Private subnet backend sg"
}


variable "tf_tag" {
    type = bool
    default = true         
    description = "Terraform identifier"
  
}



variable "key" {
  description = "Compute access key"
}