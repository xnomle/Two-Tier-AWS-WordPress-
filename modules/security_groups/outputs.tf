output "ec2_sg" {
    value = aws_security_group.EC2_sg.id
}
output "database_sg" {
    value = aws_security_group.database_sg.id
  
}
output "efs_sg" {
    value = [aws_security_group.efs_sg.id]
  
}