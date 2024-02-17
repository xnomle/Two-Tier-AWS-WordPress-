variable "public_subnet_1_id" {
    type = string
}

variable "public_subnet_2_id" {
    type = string
}

variable "ec2_sg" {

type = string
}
variable "target_application_port" {
  type    = string
  default = "80"
}

variable "vpc_id" {
    type = string
    description = "VPC ID"
  
}

variable "web_server_1_id" {
 type = string
  
}

variable "web_server_2_id" {
 type = string
  
}