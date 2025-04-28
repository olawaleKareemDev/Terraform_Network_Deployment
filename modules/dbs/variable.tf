variable "private_subnets_database" {
  description = "Private subnet database "
}

variable "private_subnets_database_sg" {
  description = "Database security group"
}

variable "subnets_az" {
    description = "VPC subnets availability zone"
    type        = list(string)
    default = ["us-east-1a", "us-east-1b" ]    
  
}