data "aws_region" "current" {}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"   
}

module "subnet" {
  source   = "./modules/subnet"
  vpc_id   = module.vpc.vpc_id  
  vpc_cidr_public_subnets_frontend= ["10.0.160.0/20", "10.0.176.0/20" ] 
  vpc_cidr_private_subnets_backend= ["10.0.192.0/20", "10.0.208.0/20" ] 
  vpc_cidr_private_subnets_database=["10.0.224.0/20", "10.0.240.0/20" ] 

}

module "gateways" {
  source = "./modules/gateways"
  vpc_id = module.vpc.vpc_id  
  vpc_cidr = module.vpc.vpc_cidr
  public_subnets_frontend = module.subnet.public_subnets_frontend
}

module "route_tables" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id  
  vpc_cidr = module.vpc.vpc_cidr  
  public_subnets_frontend = module.subnet.public_subnets_frontend
  private_subnets_backend = module.subnet.private_subnets_backend
  private_subnets_database = module.subnet.private_subnets_database
  internet_gateway_id = module.gateways.internet_gateway_id
  nat_gateway_id = module.gateways.nat_gateway_id

}

module "keys" {
  source = "./modules/keys"
}


module "sgs" {
  source = "./modules/sgs"
  vpc_id = module.vpc.vpc_id  
  public_subnets_frontend = module.subnet.public_subnets_frontend
  private_subnets_backend = module.subnet.private_subnets_backend
  
}



module "ec2" {
  source = "./modules/ec2"
  public_subnets_frontend = module.subnet.public_subnets_frontend
  private_subnets_backend = module.subnet.private_subnets_backend
  public_subnets_frontend_sg = module.sgs.frontend_sg_id
  private_subnets_backend_sg = module.sgs.backend_sg_id
  key = module.keys.key

}


module "dbs" {
  source = "./modules/dbs"
  private_subnets_database = module.subnet.private_subnets_database
  private_subnets_database_sg = module.sgs.db_sg_id
  
}



