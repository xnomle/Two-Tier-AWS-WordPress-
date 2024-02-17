variable "vpc_id" {
description = "vpc_id" 
type = string   
}

variable "inbound_ports_ec2" {
  type        = list(any)
  default     = [22, 80]
  description = "inbound port allow on production instance"
}

