data "aws_availability_zones" "available" {}


resource "aws_subnet" "public_subnets_frontend" {
  for_each          = var.public_subnets_frontend_name
  vpc_id            = var.vpc_id
  cidr_block        = var.vpc_cidr_public_subnets_frontend[each.value - 1]
  availability_zone = var.subnets_az[each.value - 1]

  tags = {
    Name      = each.key
    Terraform = "true"
  }
}


resource "aws_subnet" "private_subnets_backend" {
  for_each          = var.private_subnets_backend_name
  vpc_id            = var.vpc_id
  cidr_block        = var.vpc_cidr_private_subnets_backend[each.value - 1]
  availability_zone = var.subnets_az[each.value - 1]

  tags = {
    Name      = each.key
    Terraform = "true"
  }
}

resource "aws_subnet" "private_subnets_database" {
  for_each          = var.private_subnets_database_name
  vpc_id            = var.vpc_id
  cidr_block        = var.vpc_cidr_private_subnets_database[each.value - 1]
  availability_zone = var.subnets_az[each.value - 1]

  tags = {
    Name      = each.key
    Terraform = "true"
  }
}


