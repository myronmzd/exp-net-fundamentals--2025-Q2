provider "aws" {
  region = var.aws_region
}

module "network" {
  source      = "./modules/network"
  vpc_cidr    = var.vpc_cidr
  subnet_private_cidr = var.subnet_private_cidr
  subnet_public_cidr = var.subnet_public_cidr
} 

module "compute" {
  source           = "./modules/compute"
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  subnet_id        = module.network.subnet_id_public
  security_group = module.network.security_group_id
  key_name         = "mykey"
}

# VPC: 10.200.123.0/24 → 251 usable IPs total

# Split into two /25:

# 10.200.123.0/25 → Public → 123 usable IPs   IP range: 10.200.123.0 - 10.200.123.127

# 10.200.123.128/25 → Private → 123 usable IPs  IP range: 10.200.123.128 - 10.200.123.255

