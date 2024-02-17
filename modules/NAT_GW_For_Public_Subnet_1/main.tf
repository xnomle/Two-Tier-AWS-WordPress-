resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id = var.eip_ids[0]
  subnet_id = var.subnet_id
  tags = {
    Name = "Private_Subnet_NatGateway_1"
  }
}