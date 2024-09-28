variable "cidr_public_subnet" {
  description = "please provide cidr range of public subnets"
  type = list(string)
}

variable "public_route_table_id" {
  description = "please enter the public route table id for public route table association"
  type = string
}

variable "public_subnets_id" {
  description = "Please enter the ids of your public subnets"
  type = list(string)
}

variable "cidr_private_subnet" {
  description = "please enter the private subnet cidr rangs"
  type = list(string)
}

variable "private_route_table_id" {
  description = "please enter the private route tables id"
  type = list(string)
}

variable "private_subnets_id" {
  description = "please enter the values of your privat subnets"
  type = list(string)
}