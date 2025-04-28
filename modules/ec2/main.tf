data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_launch_template" "frontend_launch_template" {
  image_id         = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = var.key.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              echo '<h1>Frontend Server</h1>' | sudo tee /var/www/html/index.html
              sudo systemctl restart nginx
              EOF


  cpu_options {
    core_count       = 4
    threads_per_core = 2
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "FrontendServer"
    }
  }

  network_interfaces {
    associate_public_ip_address = true
  }

  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = 20
    }
  }

  vpc_security_group_ids = [var.public_subnets_frontend_sg]

}

resource "aws_autoscaling_group" "frontend_asg" {

  launch_template {
    id = aws_launch_template.frontend_launch_template.id
  }

  vpc_zone_identifier = [ var.public_subnets_frontend["public_subnet_frontend_1"].id,
                          var.public_subnets_frontend["public_subnet_frontend_2"].id
                        ]
  min_size          = 2
  max_size          = 2
  desired_capacity  = 2
 

  tag {
    key                 = "Name"
    value               = "FrontendServerASG"
    propagate_at_launch = true
  }
}


resource "aws_launch_template" "backend_launch_template" {
  image_id         = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = var.key.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              echo '<h1>Backend Server</h1>' | sudo tee /var/www/html/index.html
              sudo systemctl restart nginx
              EOF


  cpu_options {
    core_count       = 4
    threads_per_core = 2
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "BackendServer"
    }
  }

  network_interfaces {
    associate_public_ip_address = false
  }

  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = 20
    }
  }

  vpc_security_group_ids = [var.private_subnets_backend_sg]

}

resource "aws_autoscaling_group" "backend_asg" {

  launch_template {
    id = aws_launch_template.frontend_launch_template.id
  }

  vpc_zone_identifier = [ var.private_subnets_backend["private_subnet_backend_1"].id,
                          var.private_subnets_backend["private_subnet_backend_2"].id
                        ]
  min_size          = 2
  max_size          = 2
  desired_capacity  = 2
 

  tag {
    key                 = "Name"
    value               = "BackendServerASG"
    propagate_at_launch = true
  }
}



data "aws_instances" "asg_frontend_instances" {
  filter {
    name   = "tag:Name"
    values = ["FrontendServerASG"]
  }
}

data "aws_instances" "asg_backend_instances" {
  filter {
    name   = "tag:Name"
    values = ["BackendServerASG"]
  }
}

