resource "aws_route_table_association" "public_subnet_association" {
  count = length(var.cidr_public_subnet)            #how many association tables is needed
    
    subnet_id = element(var.public_subnets_id , count.index)                          #assign each public subnet id to route table and associate it
  route_table_id = var.public_route_table_id
}


resource "aws_route_table_association" "private_subnet_association" {
  count = length(var.cidr_private_subnet)
  subnet_id = element(var.private_subnets_id , count.index) # here you are assocating each private subnet to each route table
  route_table_id =     var.private_route_table_id[count.index]    # here you are associating your each privat route tabels to each private subnet          
}