output "public_subnet_1_id" {
  description = "This is the id of your first public subnets"
   value = aws_subnet.aws_public_subnet[0].id
  
}

output "public_subnet_2_id" {
    description = "This is the id of your second public subnet"
  value = aws_subnet.aws_public_subnet[1].id
}


output "all_public_subnets_ids" {
  description = "values of public subnet ids"
  value = aws_subnet.aws_public_subnet[*].id   # here all public subnet ids are created
}

output "all_private_subnets_ids" {
  description = "values of your private subnets ids"
  value = aws_subnet.aws_private_subnet[*].id
}

output "private_subnet_1_id" {
  description = "This is the id of your first private subnet"
  value = aws_subnet.aws_private_subnet[0].id 
}

output "private_subnet_2_id" {
  description = "This is the id of your second private subnet"
  value = aws_subnet.aws_private_subnet[1].id
}




