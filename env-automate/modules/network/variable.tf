variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_private_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}
variable "subnet_public_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}