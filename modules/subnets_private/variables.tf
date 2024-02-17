variable "private_subnets" {
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
  }
}
variable "vpc_cidr" {
  description = "The CIDR Block for the VPC"
  type = string
  default = "10.0.0.0/16"
 }
 variable "vpc_id" {
  description = "the ID of the VPC"
  type = string
   
 }
variable "availability_zone_names" {
  description = "AZs names"
  type = list(string)
  
}
