resource "aws_route_table" "public_route_table_frontend" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.internet_cidr
    gateway_id = var.internet_gateway_id
  }
  tags = {
    Name      = var.name_pub_rtb_frontend_tag
    Terraform = var.tf_tag
  }
}

resource "aws_route_table" "private_route_table_backend" {
  vpc_id = var.vpc_id

  route {
    # cidr_block = var.public_subnets_frontend["public_subnet_frontend_1"].cidr_block  
    cidr_block = var.internet_cidr
    nat_gateway_id = var.nat_gateway_id
  }
  tags = {
    Name      = var.name_priv_rtb_backend_tag
    Terraform = var.tf_tag
  }
}


resource "aws_route_table" "private_route_table_database" {
  vpc_id = var.vpc_id

  route {
    # cidr_block = var.public_subnets_frontend["public_subnet_frontend_2"].cidr_block 
    cidr_block = var.internet_cidr
    nat_gateway_id = var.nat_gateway_id
  }
  tags = {
    Name      = var.name_priv_rtb_database_tag
    Terraform = var.tf_tag
  }
}




resource "aws_route_table_association" "public_route_table_frontend_assoc" {
  depends_on     = [var.public_subnets_frontend]
  route_table_id = aws_route_table.public_route_table_frontend.id
  for_each       = var.public_subnets_frontend
  subnet_id      = each.value.id
}

resource "aws_route_table_association" "private_route_table_backend_assoc" {
  depends_on     = [var.private_subnets_backend]
  route_table_id = aws_route_table.private_route_table_backend.id
  for_each       = var.private_subnets_backend
  subnet_id      = each.value.id
}


resource "aws_route_table_association" "private_route_table_database_assoc" {
  depends_on     = [var.private_subnets_database]
  route_table_id = aws_route_table.private_route_table_database.id
  for_each       = var.private_subnets_database
  subnet_id      = each.value.id
}