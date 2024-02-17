variable "mount_directory" {
  type    = string
  default = "/var/www/html"
  sensitive = false
}

variable "db_user" {
    type = string  
    sensitive = false
}

variable "rds_db_endpoint" {
    type = string
    sensitive = false
  
}

variable "rds_db_password" {
    type = string
    sensitive = false
}  


variable "efs_volume_id" {

 type = string
 sensitive = false
  
}

variable "private_key_pem" {
  description = "The private key in PEM format"
  type        = string
  sensitive   = true
}

