#resource "aws_subnet" "public_subnets" {
 # vpc_id                  = var.vpc_id
 # cidr_block              = cidrsubnet(var.vpc_cidr, 8, each.value + 100)
 # availability_zone       = tolist(module.availability_zones.available_azs)[each.value - 1]
 # map_public_ip_on_launch = true

#  tags = {
#   Terraform = "true"
#  }
#}


resource "aws_subnet" "public_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 100)
  availability_zone = var.availability_zone_names[0] 
  map_public_ip_on_launch = true

  tags = {
    Name      = "public-subnet-1"
    Terraform = "true"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 200)
  availability_zone = var.availability_zone_names[1]
  map_public_ip_on_launch = true
  tags = {
    Name      = "public-subnet-2"
    Terraform = "true"
  }
}
