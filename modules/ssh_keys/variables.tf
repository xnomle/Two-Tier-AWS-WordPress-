variable "private_key_location" {
  description = "Location of the private key"
  type        = string
  default     = "aws_access_key_private.pem"
}
variable "Public_key_location" {
  description = "Location of the Public key"
  type        = string
  default     = "aws_access_key_public"
}

variable "web_server_1_id" {
  type = string
}

variable "web_server_2_id" {
  type = string
}



