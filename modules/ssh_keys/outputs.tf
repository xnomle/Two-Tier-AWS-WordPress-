output "public_key" {
  description = "The public SSH key"
  value       = tls_private_key.ssh.public_key_openssh
  sensitive   = true
}

output "private_key_path" {
  value     = local_file.private_key.filename
  sensitive = true
}


output "private_key_pem" {
  value = tls_private_key.ssh.private_key_pem
  sensitive = true
}
