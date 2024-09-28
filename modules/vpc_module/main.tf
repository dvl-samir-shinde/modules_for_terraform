
provider "aws" {
  
  region = var.aws_region_value
}

# resource "aws_vpc" "module_vpc" {
#   cidr_block = var.vpc_cidr
#   tags = {
#     Name = "vpc_with_ip_ranges_for_all"
#   }
# }


resource "aws_vpc" "vpc_with_cider" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "first_vpc_with_cider"
  }
}