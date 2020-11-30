variable "access_key" {
     default = "AKIASEMB7LUCPGQAKFMF"
     
}
variable "secret_key" {
     default = "+pohPEzkdkH1RLFjSrYiwD9AZE5wfkumoy6nANh3"
     
}

variable "region" {
  default     = "eu-west-3"
  type        = string
  description = "Region of the VPC"
}


variable "cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  default     = "10.0.0.0/24"
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  default     = "10.0.1.0/24"
  description = "List of private subnet CIDR blocks"
}

variable "availability_zones" {
  default     = "eu-west-3a"
  description = "List of availability zones"
}