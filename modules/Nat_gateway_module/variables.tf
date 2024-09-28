variable "cidr_private_subnet" {
  description = "Please give the cidr rangs of private subnates for eip"
  type = list(string)
}

variable "list_of_private_subnet_id" {
  description = "Please provide the id of your subnet to assign the natgatway to it"
  type = list(string)
}