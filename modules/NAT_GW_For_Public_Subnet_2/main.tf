resource "aws_nat_gateway" "nat_gateway_2" {
  allocation_id = var.eip_ids[1]
  subnet_id = var.subnet_id
  tags = {
    Name = "Private_Subnet_NatGateway_2"
  }
}