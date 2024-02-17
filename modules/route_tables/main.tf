resource "aws_route_table" "public_route_table_1" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }

  tags = {
    Name      = "Prod_Public_Route_Table_1"
    Terraform = "true"
  }
}

resource "aws_route_table" "public_route_table_2" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id = var.gateway_id 
     }



}
