output "private_subnet_1_id" {
  value = aws_subnet.private_subnet_1.id
  description = "The ID of the first private subnet"
 
}

output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
  description = "The ID of the second private subnet"
}
