variable "existing_vpc_id" {
  description = "Plesase enter the existing vpc id"
  type = string
}


variable "cidr_public_subnet" {
  description = "please give the list of IP address for public subnet"
  type = list(string)
}

variable "_availability_zone" {
  description = "please give your avilablity_zone for each subnet"
  type = list(string)
}

variable "cidr_private_subnet" {
  description = "please give the list if your IP address for private subnet"
  type = list(string)
}