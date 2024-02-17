variable "db_name" {
    type = string
    default = "Web_RDS_DB"
  
}

variable "db_user" {
    type = string
    default = "Noodle"
    
}

variable "db_password" {
    type = string
    default = "ThinkPad69"
  
}

variable "availability_zone" {
  description = "AZs names"
  type = list(string)
}

variable "private_subnet_1_id" {
    type = string  
}

variable "private_subnet_2_id" {
    type = string  
}

variable "database_sg" {
    type = string  
}