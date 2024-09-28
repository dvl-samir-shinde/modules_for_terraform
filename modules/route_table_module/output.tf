output "public_route_table_id_for_table_association" {
  value = aws_route_table.aws_route_table_for_IGW.id
}


output "private_route_table_ids_for_table_association" {
  value = aws_route_table.aws_route_table_for_private_vpc[*].id
}