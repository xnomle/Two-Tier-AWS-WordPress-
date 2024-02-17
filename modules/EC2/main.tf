resource "aws_key_pair" "EC2_ssh_key" {
  key_name = "ec2_ssh_key"
  public_key = var.public_key
}
resource "aws_instance" "web_server_1" {
  ami           = var.ubuntu_ami_id
  instance_type = "t2.micro"
  key_name = aws_key_pair.EC2_ssh_key.key_name
  subnet_id     = var.public_subnet_1_id
    vpc_security_group_ids = [var.ec2_sg]
  tags = {
    Name = "Web_Server_1"
  }
}

resource "aws_instance" "web_server_2" {
  ami           = var.ubuntu_ami_id
  instance_type = "t2.micro"
  key_name = aws_key_pair.EC2_ssh_key.key_name
  subnet_id     = var.public_subnet_2_id
  vpc_security_group_ids = [var.ec2_sg] 
  tags = {
    Name = "Web_Server_2"
  }
}



