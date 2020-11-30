variable "cidr_block" {
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  description = "List of private subnet CIDR blocks"
}

variable "availability_zones" {
  description = "List of availability zones"
}