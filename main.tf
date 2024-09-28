module "vpc_module" {
  source           = "./modules/vpc_module"
  vpc_cidr         = "10.0.0.0/16"
  aws_region_value = "ap-south-1"


}


output "aws_vpc_id" {
  description = "This is the id of your vpc"
  value       = module.vpc_module.aws_vpc_id
}


module "subnet_module" {
  source = "./modules/subnet_module"
  #    providers = {
  #     aws = "hashicorp/aws"
  #   }
  existing_vpc_id     = module.vpc_module.aws_vpc_id
  cidr_public_subnet  = ["10.0.2.0/24", "10.0.3.0/24"]
  cidr_private_subnet = ["10.0.4.0/24", "10.0.5.0/24"]
  _availability_zone  = ["ap-south-1a", "ap-south-1b"]

}


output "public_subnet_1_id" {
  description = "This is the id of your first public subnets"
  value       = module.subnet_module.public_subnet_1_id #aws_subnet.aws_public_subnet[0].id

}

output "public_subnet_2_id" {
  description = "This is the id of your second public subnet"
  value       = module.subnet_module.public_subnet_2_id #aws_subnet.aws_public_subnet[1].id
}


output "private_subnet_1_id" {
  description = "This is the id of your first private subnet"
  value       = module.subnet_module.private_subnet_1_id #aws_subnet.aws_private_subnet[0].id 
}

output "private_subnet_2_id" {
  description = "This is the id of your second private subnet"
  value       = module.subnet_module.private_subnet_2_id #aws_subnet.aws_private_subnet[1].id
}

module "internet_gateway_module" {
  source = "./modules/internet_gateway_module"
  vpc_id = module.vpc_module.aws_vpc_id
}

output "aws_internet_gateway_id" {
  value = module.internet_gateway_module.aws_internet_gateway_id
}


# here i am calling  nat_gateway module

module "nat_gateway" {
  source                    = "./modules/Nat_gateway_module"
  cidr_private_subnet       = ["10.0.4.0/24", "10.0.5.0/24"]
  list_of_private_subnet_id = ["${module.subnet_module.private_subnet_1_id}", "${module.subnet_module.private_subnet_2_id}"]

}


output "aws_eip_eip_for_nat_gateway_value" {
  value = module.nat_gateway.aws_eip_eip_for_nat_gateway_value
}

output "nat_id_for_route" {
  value = module.nat_gateway.nat_id
}


module "route_rable" {
  source                  = "./modules/route_table_module"
  depends_on              = [module.nat_gateway]
  vpc_id                  = module.vpc_module.aws_vpc_id
  cidr_block_range        = "0.0.0.0/0"
  internet_gateway_id     = module.internet_gateway_module.aws_internet_gateway_id
  cidr_private_subnet     = ["10.0.4.0/24", "10.0.5.0/24"]
  existing_nat_gateway_id = module.nat_gateway.nat_id




}


output "private_rt_id" {
  value = module.route_rable.private_route_table_ids_for_table_association
}

module "route_table_association" {
  source     = "./modules/route_table_association_module"
  depends_on = [module.subnet_module, module.route_rable]

  cidr_public_subnet     = ["10.0.2.0/24", "10.0.3.0/24"]
  public_route_table_id  = module.route_rable.public_route_table_id_for_table_association
  public_subnets_id      = module.subnet_module.all_public_subnets_ids
  private_subnets_id     = module.subnet_module.all_private_subnets_ids
  cidr_private_subnet    = ["10.0.4.0/24", "10.0.5.0/24"]
  private_route_table_id = module.route_rable.private_route_table_ids_for_table_association

}