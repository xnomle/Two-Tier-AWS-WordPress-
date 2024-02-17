 
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
 
resource "aws_key_pair" "aws_ec2_access_key" {
  key_name_prefix = "efs_key"
  public_key      = tls_private_key.ssh.public_key_openssh
}
 
resource "local_file" "private_key" {
  content  = tls_private_key.ssh.private_key_pem
  filename = "aws_access_key_private.pem"
   
}

resource "local_file" "public_key" {
  content  = tls_private_key.ssh.public_key_openssh
  filename = var.Public_key_location 
}
 

