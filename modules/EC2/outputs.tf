output "web_server_1_id" {
    value = aws_instance.web_server_1.id 
}

output "web_server_2_id" {
    value = aws_instance.web_server_2.id
  
}

output "web_server_1_public_IP" {
    value = aws_instance.web_server_1.public_ip
  
}

output "web_server_2_public_IP" {

  value = aws_instance.web_server_2.public_ip
}


