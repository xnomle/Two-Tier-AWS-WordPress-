output "web_server_1_public_IP" {
  value = module.EC2.web_server_1_public_IP

}

output "web_server_2_public_IP" {
  value = module.EC2.web_server_2_public_IP

}

# print the DNS of load balancer
output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.application_loadbalancer.lb_dns_name
}


output "ec2_data" {
  value = module.script.ec2_check

}

