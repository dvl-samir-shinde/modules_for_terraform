# here i am creating nat_gatway 

resource "aws_eip" "eip_for_nat_gateway" {
  count = length(var.cidr_private_subnet)  # how much elastic ip address you want for each private subnet you require on eip
#   count = 1
  vpc = true
}


resource "aws_nat_gateway" "nat_gateway_for_private_subnates" {
  count =  length(var.cidr_private_subnet) # how many nat gateway you want to create
#   count = 1
  depends_on = [ aws_eip.eip_for_nat_gateway ]  # before creating nat_gateway you have to make eip
  allocation_id = aws_eip.eip_for_nat_gateway[count.index].id
    #allocation_id = aws_eip.eip_for_nat_gateway.id  #this is giving error because of count in our eip address
#   subnet_id = aws_subnet.aws_private_subnet[count.index].id  # here i require private subnet id for my each nat_gateway
    #subnet_id = var.first_private_subnet_id   # to wich subnet i want to assign this nat gatway
    # for_each = tolist(var.list_of_private_subnet_id)              #to(var.list_of_private_subnet_id)
    # subnet_id = each.value
    subnet_id = var.list_of_private_subnet_id[count.index]

    tags = {
      Name = "Nat gateway for private subnet ${count.index + 1}"
    }
}