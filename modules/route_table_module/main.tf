resource "aws_route_table" "aws_route_table_for_IGW" {
  vpc_id = var.vpc_id # here i give the vpc in wich i want to create this route table
  route  {
    cidr_block = var.cidr_block_range

    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "Route Table for IGW"
  }
}

resource "aws_route_table" "aws_route_table_for_private_vpc" {
  count = length(var.cidr_private_subnet)    #for private subnet how many route table need to be created
  vpc_id = var.vpc_id  # to which vpc you want to add this route table
  #depends_on = [ aws_nat_gateway.nat_gateway_for_private_subnates ]   # route table is depend on the aws_nat_gateway so that nat_gateway need to be created first
  
  route  {
    cidr_block = var.cidr_block_range
    nat_gateway_id =  var.existing_nat_gateway_id[count.index]                      # here you will require nat_gateway_id 
  }

  tags = {
    Name = "Route tabel for private subnate ${count.index + 1}"
  }
}