resource "aws_internet_gateway" "vpc_internet_gatway" {
  vpc_id = var.vpc_id # to which vpc this IGW will be attatched
  tags = {
    Name = "IGW for this vpc or module"
  }
}