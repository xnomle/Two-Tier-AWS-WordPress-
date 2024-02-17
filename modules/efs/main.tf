
resource "aws_efs_file_system" "efs_volume" {
  creation_token = "efs_volume"
}
 
resource "aws_efs_mount_target" "efs_mount_target_1" {
  file_system_id  = aws_efs_file_system.efs_volume.id
  subnet_id       = var.public_subnet_1_id
  security_groups = var.efs_sg
}
 
resource "aws_efs_mount_target" "efs_mount_target_2" {
  file_system_id  = aws_efs_file_system.efs_volume.id
  subnet_id       = var.public_subnet_2_id
  security_groups = var.efs_sg
}
