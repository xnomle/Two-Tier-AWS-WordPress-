#output "eip_ids" {
#  value = [aws_eip.nat_gateway_eip_1.id, aws_eip.nat_gateway_eip_2.id] 
#}
output "eip_ids" {
 value = aws_eip.eip.*.id 
}
