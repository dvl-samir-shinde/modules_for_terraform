output "aws_vpc_id" {
  description = "this is the id of your vpc"
  value = aws_vpc.vpc_with_cider.id

}