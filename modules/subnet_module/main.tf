resource "aws_subnet" "aws_public_subnet" {
#   count =  2    # how much public subnets you want to create
  count = length(var.cidr_public_subnet)
  vpc_id = var.existing_vpc_id # on which vpc you want to create there subnets
  cidr_block = element(var.cidr_public_subnet , count.index)                # you want to assign cidr blocks to each sunbet
  availability_zone = element(var._availability_zone , count.index)
#   availability_zone = var._availability_zone
  
  tags = {
    Name = "public-subnet:public-subnet-number: ${count.index + 1}"
  }
}


resource "aws_subnet" "aws_private_subnet" {
#   count = 2   # how much pricate subnet you want
  count = length(var.cidr_private_subnet)
  vpc_id = var.existing_vpc_id
  cidr_block = element(var.cidr_private_subnet , count.index)
#   availability_zone = var._availability_zone # in which avilablity zone i want by private subnet
  availability_zone = element(var._availability_zone , count.index)

  tags = {
    Name = "private-subnet: private-subnet-number: ${count.index + 1}"
  }
}