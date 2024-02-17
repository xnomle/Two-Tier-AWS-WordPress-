output "ec2_check" {
    value = data.aws_instances.web_servers
  
}
output "web_servers_public_ips" {
  value = data.aws_instances.web_servers.public_ips
}
