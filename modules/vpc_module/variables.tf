variable "aws_region_value" {
  description = "please provide the region for your vpc"
  type = string
}

variable "vpc_cidr" {
  description = "please provide the cidr_block range fro your vpc"
  type = string
  # default = "10.0.0.0/16"
}