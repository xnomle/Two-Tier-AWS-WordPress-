resource "aws_db_subnet_group" "database_subnet" {
  name       = "db subnet"
  subnet_ids = [var.private_subnet_1_id, var.private_subnet_2_id]
}