output "db_user" {
    value = aws_db_instance.rds_master.username
  
}

output "rds_db_endpoint" {
    value = aws_db_instance.rds_master.endpoint
  
}

output "rds_db_password" {
   value = aws_db_instance.rds_master.password
  
}