# Associate the route table with each private subnet
#resource "aws_route_table_association" "private_rta" {
#  for_each       = var.private_subnet_ids
#  route_table_id = var.route_table_ids 
#  subnet_id      = each.value.id
 #depends_on     = [aws_subnet.private_subnets]
# main.tf
resource "aws_route_table_association" "route-ec2-1-subnet-to-igw" {

  subnet_id      = var.public_subnet_1_id
  route_table_id = var.public_route_table_1_id
}
