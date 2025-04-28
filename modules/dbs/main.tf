
data "hcp_vault_secrets_app" "db_secrets" {
  app_name = "retrunBuildApp"

}


resource "aws_db_subnet_group" "database_subnet_group" {
  name       = "mydb-subnet-group"
  description = "My DB subnet group"
  subnet_ids = [var.private_subnets_database["private_subnet_database_1"].id,  var.private_subnets_database["private_subnet_database_2"].id ]
}

resource "aws_db_instance" "db_1" {
  allocated_storage    = 10
  db_name              = "mydb_1"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = data.hcp_vault_secrets_app.db_secrets.secrets["db_username"]
  password             = data.hcp_vault_secrets_app.db_secrets.secrets["db_password"]
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  db_subnet_group_name = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids = [var.private_subnets_backend_sg]
  availability_zone      = var.subnets_az[0]  


}


resource "aws_db_instance" "db_2" {
  allocated_storage    = 10
  db_name              = "mydb_2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = data.hcp_vault_secrets_app.db_secrets.secrets["db_username"]
  password             = data.hcp_vault_secrets_app.db_secrets.secrets["db_password"]
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  db_subnet_group_name = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids = [var.private_subnets_backend_sg]
  availability_zone      = var.subnets_az[1] 


}



