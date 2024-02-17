terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-2"
}

# Create a VPC
module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  vpc_name   = "ProductionVPC"
}

module "availability_zones" {
  source = "./modules/aws_availability_zones"
}

#Deploy the private subnets
module "private_subnets" {
  source                  = "./modules/subnets_private"
  vpc_id                  = module.vpc.vpc_id
  availability_zone_names = module.availability_zones.availability_zone_names
}

#Deploy the public subnets
module "public_subnets" {
  source                  = "./modules/subnets_public"
  vpc_id                  = module.vpc.vpc_id
  availability_zone_names = module.availability_zones.availability_zone_names

}

#Create route tables for public subnets
module "route_table" {
  source     = "./modules/route_tables"
  vpc_id     = module.vpc.vpc_id
  gateway_id = module.internet_gateway.internet_gateway_id
}
# Associate the route table with each public subnet
module "aws_route_table_association_1" {
  source                  = "./modules/associate_route_table_1"
  public_subnet_1_id      = module.public_subnets.public_subnet_1_id
  public_route_table_1_id = module.route_table.public_route_table_1_id
}

# Associate the route table with each public subnet
module "aws_route_table_association_2" {
  source                  = "./modules/associate_route_table_2"
  public_subnet_2_id      = module.public_subnets.public_subnet_2_id
  public_route_table_2_id = module.route_table.public_route_table_2_id
}

#Create Internet Gateway
module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}


module "EC2" {
  source             = "./modules/EC2"
  public_subnet_1_id = module.public_subnets.public_subnet_1_id
  public_subnet_2_id = module.public_subnets.public_subnet_2_id
  ec2_sg             = module.security_groups.ec2_sg
  public_key         = module.ssh_keys.public_key
}


module "rds_db" {
  source              = "./modules/rds_db"
  availability_zone   = module.availability_zones.availability_zone_names
  private_subnet_1_id = module.private_subnets.private_subnet_1_id
  private_subnet_2_id = module.private_subnets.private_subnet_2_id
  database_sg         = module.security_groups.database_sg

}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "application_loadbalancer" {
  source             = "./modules/load_balancer"
  public_subnet_1_id = module.public_subnets.public_subnet_1_id
  public_subnet_2_id = module.public_subnets.public_subnet_2_id
  ec2_sg             = module.security_groups.ec2_sg
  vpc_id             = module.vpc.vpc_id
  web_server_1_id    = module.EC2.web_server_1_id
  web_server_2_id    = module.EC2.web_server_2_id
}

module "efs" {
  source             = "./modules/efs"
  efs_sg             = module.security_groups.efs_sg
  public_subnet_1_id = module.public_subnets.public_subnet_1_id
  public_subnet_2_id = module.public_subnets.public_subnet_2_id

}


module "ssh_keys" {
  source          = "./modules/ssh_keys"
  web_server_1_id = module.EC2.web_server_1_id
  web_server_2_id = module.EC2.web_server_2_id
}

module "script" {
  source          = "./modules/script"
  db_user         = module.rds_db.db_user
  rds_db_endpoint = module.rds_db.rds_db_endpoint
  rds_db_password = module.rds_db.rds_db_password
  efs_volume_id   = module.efs.efs_volume_id
  private_key_pem = module.ssh_keys.private_key_pem

  depends_on = [module.EC2]
}


#Create NAT Gateway For Public Subnet 1
#module "NAT_GW_Public_Subnet_1" {
#  source = "./modules/NAT_GW_For_Public_Subnet_1"
#  eip_ids = module.EIP.eip_ids 
#  subnet_id = module.public_subnets.public_subnet_1_id
#}

#Create NAT Gateway For Public Subnet 2
#module "NAT_GW_Public_Subnet_2" {
#  source = "./modules/NAT_GW_For_Public_Subnet_2"
#  eip_ids = module.EIP.eip_ids 
#  subnet_id = module.public_subnets.public_subnet_2_id
#}

#Create EIP for NAT Gateway 
#module "EIP" {
#  source = "./modules/EIP"
#}