output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
  description = "The ID of the first public subnet"
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
  description = "The ID of the second public subnet"
}
