variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "subnet_public_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.200.123.0/25"
}

variable "subnet_private_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.200.123.128/25"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.200.123.0/24"
}

variable "ami_id_win" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-0266c1f64e2a73942"
}


variable "ami_id_linux" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-0266c1f64e2a73942"
}
variable "ami_id_redhat" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-0266c1f64e2a73942"
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}


variable "instance_type_win" {
  description = "EC2 instance type for Windows"
  type        = string
  default     = "t3.micro"
}
variable "instance_type_linux" {
  description = "EC2 instance type for Linux"
  type        = string
  default     = "t3.micro"
}
variable "instance_type_redhat" {
  description = "EC2 instance type for Red Hat Linux"
  type        = string
  default     = "t3.micro"
}