resource "aws_subnet" "private_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, var.private_subnets["private_subnet_1"])
  availability_zone = var.availability_zone_names[0] 

  tags = {
    Name      = "private-subnet-1"
    Terraform = "true"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, var.private_subnets["private_subnet_2"])
  availability_zone = var.availability_zone_names[1]
  tags = {
    Name      = "private-subnet-2"
    Terraform = "true"
  }
}
