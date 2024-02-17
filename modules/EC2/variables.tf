variable "public_subnets" {
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
  }
}

variable "public_subnet_1_id"{
    description = "Subnet ID for Public Subnet 1"
    type = string
  
}

variable "public_subnet_2_id"{
    description = "Subnet ID for Public Subnet 2"
    type = string
  
}
variable "ubuntu_ami_id" {
    description = "AMI ID for EC2 "
    default = "ami-0611295b922472c22"
    type = string

  
}

variable "ec2_sg" {
    description = "EC2 Security group ID"
    type = string
  
}

variable "public_key" {
  description = "The public SSH key for the EC2 instance"
  type        = string
  sensitive   = true
}