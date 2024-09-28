output "aws_eip_eip_for_nat_gateway_value" {
    
  value = aws_eip.eip_for_nat_gateway[*].public_ip
}


output "nat_id" {

 value = aws_nat_gateway.nat_gateway_for_private_subnates[*].id
 
}
