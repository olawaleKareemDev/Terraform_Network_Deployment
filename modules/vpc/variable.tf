variable "vpc_name" {
  type    = string
  default = "3_Tier_vpc"     
  description = "vpc name"
}

variable "vpc_cidr" {
  type    = string
  # default = "10.0.0.0/16"     
  description = "vpc cidr"
}

variable    "environment" {
    type= string
    default= "demo environment"           
    description = "Environment of deployment"
}

variable "tf_tag" {
    type = bool
    default = true         #
    description = "Terraform identifier"
  
}