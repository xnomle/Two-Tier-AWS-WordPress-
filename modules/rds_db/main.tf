resource "aws_db_subnet_group" "database_subnet" {
  name       = "db subnet"
  subnet_ids = [var.private_subnet_1_id, var.private_subnet_2_id]
}

resource "aws_db_instance" "rds_master" {
  identifier              = "master-rds-instance"
  allocated_storage       = 10
  engine                  = "mysql"
  engine_version          = "5.7.37"
  instance_class          = "db.t2.micro"
  db_name                 = var.db_name
  username                = var.db_user
  password                = var.db_password
  backup_retention_period = 7
  multi_az                = false
  availability_zone      = var.availability_zone[0]
  db_subnet_group_name    = aws_db_subnet_group.database_subnet.id
  skip_final_snapshot     = true
  vpc_security_group_ids  = [var.database_sg]
  #storage_encrypted       = true
 
  tags = {
    Name = "rds-master"
  }
}
 
resource "aws_db_instance" "rds_replica" {
  replicate_source_db    = aws_db_instance.rds_master.identifier
  instance_class         = "db.t2.micro"
  identifier             = "replica-rds-instance"
  allocated_storage      = 10
  skip_final_snapshot    = true
  multi_az               = false
  availability_zone      = var.availability_zone[1]
  vpc_security_group_ids = [var.database_sg]
  #storage_encrypted      = true
 
  tags = {
    Name = "rds-replica"
  }
}
 
