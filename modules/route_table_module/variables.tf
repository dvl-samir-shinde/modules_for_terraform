variable "vpc_id" {
  description = "Please enter the vpc_id "
  type = string
}

variable "cidr_block_range" {
  description = "please enter the cidr range"
  type = string
}


variable "internet_gateway_id" {
  description = "Please enter the internet_gateway_id"
  type = string
}

variable "cidr_private_subnet" {
  description = "please enter the cidr_private_subnet ip range"
  type = list(string)
}

variable "existing_nat_gateway_id" {
   description = "please give the existing_nat_gateway_id"
   type = list(string)  
}