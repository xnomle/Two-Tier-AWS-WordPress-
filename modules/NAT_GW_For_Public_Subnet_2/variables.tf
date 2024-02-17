variable "eip_ids" {
  description = "List of EIP IDs"
  type        = list(string)
}
variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}
