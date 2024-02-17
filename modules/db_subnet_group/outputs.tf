output "database_subnet_id" {
    value = aws_db_subnet_group.database_subnet.id
    description = "ID of DB Subnet"
  
}
