


resource "aws_security_group" "allow_database" {
  name        = "allow_mysql"
  description = "Allow MySQL inbound traffic"
  vpc_id      = var.vpc_id 

  ingress {
    from_port   = 3306 
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [ var.private_subnets_backend["private_subnet_backend_1"].cidr_block,
                     var.private_subnets_backend["private_subnet_backend_2"].cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




resource "aws_security_group" "allow_backend" {
  name        = "allow_backend"
  description = "Allow backend inbound traffic"
  vpc_id      = var.vpc_id 

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ var.public_subnets_frontend["public_subnet_frontend_1"].cidr_block,
                     var.public_subnets_frontend["public_subnet_frontend_2"].cidr_block]
  }

  ingress { 
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      var.public_subnets_frontend["public_subnet_frontend_1"].cidr_block,
      var.public_subnets_frontend["public_subnet_frontend_2"].cidr_block
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




resource "aws_security_group" "allow_frontend" {
  name        = "allow_frontend"
  description = "Allow frontend inbound traffic"
  vpc_id      = var.vpc_id 

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { 
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}