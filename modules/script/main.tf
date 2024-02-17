data "aws_instances" "web_servers" {
  filter {
    name   = "tag:Name"
    values = ["Web_Server_1", "Web_Server_2"]
  }
}


resource "null_resource" "install_script" {
  count = 2
 

  connection {
    type        = "ssh"
    host        = data.aws_instances.web_servers.public_ips[count.index]
    user        = "ec2-user"
    private_key = var.private_key_pem
    
  }
 
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install docker -y",
      "wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)",
      "sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose",
      "sudo chmod -v +x /usr/local/bin/docker-compose",
      "sudo systemctl enable docker.service",
      "sudo systemctl start docker.service",
      "sudo yum -y install amazon-efs-utils",
      "sudo mkdir -p ${var.mount_directory}",
      "sudo mount -t efs -o tls ${var.efs_volume_id}:/ ${var.mount_directory}",
      "sudo docker run --name wordpress-docker -e WORDPRESS_DB_USER=${var.db_user} -e WORDPRESS_DB_HOST=${var.rds_db_endpoint} -e WORDPRESS_DB_PASSWORD=${var.rds_db_password} -v ${var.mount_directory}:${var.mount_directory} -p 80:80 -d wordpress:4.8-apache",
    ]
  }
}