variable "vpc_id" {
    description = "VPC ID from the VPC module"
    type        = string
}

variable "vpc_cidr" {
    description = "VPC CIDR from the VPC module"
    type        = string
}

variable "public_subnets_frontend" {
  description = "Public subnet frontend"
}

variable "private_subnets_backend" {
  description = "Private subnet backend"
}

variable "private_subnets_database" {
  description = "Private subnet database"
}


variable "internet_gateway_id" {
  description = "Internet gateway ID"

}

variable "nat_gateway_id" {
  description = "Nat gateway ID"
}

variable "tf_tag" {
    type = bool
    default = true        
    description = "Terraform identifier"
  
}

variable "name_pub_rtb_frontend_tag" {
    type = string
    default = "3_tier_public_rtb_frontend"      
    description = "Public route table frontend tag"
  
}

variable "name_priv_rtb_backend_tag" {
    type = string
    default = "3_tier_public_rtb_backend"   
    description = "Public route table backend tag"
  
}

variable "name_priv_rtb_database_tag" {
    type = string
    default = "3_tier_public_rtb_database"   
    description = "Public route table database tag"
  
}

variable "internet_cidr" {
  description = "internet cidr"
  default = "0.0.0.0/0"
  type = string
}