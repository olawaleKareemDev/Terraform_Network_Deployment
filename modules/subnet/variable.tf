variable "vpc_id" {
    description = "VPC ID from the VPC module"
    type        = string
}

variable "subnets_az" {
    description = "VPC subnets availability zone"
    type        = list(string)
    default = ["us-east-1a", "us-east-1b" ]    
  
}


variable "public_subnets_frontend_name" {
  description = "Subnets name public backend"
  type        = map(number)
  default = {
    "public_subnet_frontend_1" = 1
    "public_subnet_frontend_2" = 2

  }

}

variable "vpc_cidr_public_subnets_frontend" {
    description = "VPC CIDRs from the VPC module for public frontend subnets"
    type        = list(string)
    # default = ["10.0.160.0/20", "10.0.176.0/20" ] 
}



variable "private_subnets_backend_name" {
  description = "Subnets name private backend"
  type        = map(number)
  # default = ["private_subnet_backend_1", "private_subnet_backend_2" ] 
  default = {
    "private_subnet_backend_1" = 1
    "private_subnet_backend_2" = 2

  }

}

variable "vpc_cidr_private_subnets_backend" {
    description = "VPC CIDRs from the VPC module for private backend subnets"
    type        = list(string)
    # default = ["10.0.192.0/20", "10.0.208.0/20" ] 
}



variable "private_subnets_database_name" {
  description = "Subnets name private _database"
  type        = map(number)
  # default = ["private_subnet_database_1", "private_subnet_database_2" ] 
  default = {
    "private_subnet_database_1" = 1
    "private_subnet_database_2" = 2

  }

}

variable "vpc_cidr_private_subnets_database" {
    description = "VPC CIDRs from the VPC module for private database subnets"
    type        = list(string)
    # default = ["10.0.224.0/20", "10.0.240.0/20" ] 
}



variable "tf_tag" {
    type = bool
    default = true
    description = "Terraform identifier"
  
}
