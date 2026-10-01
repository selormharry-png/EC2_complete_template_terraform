variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "the aws profile to use"
  type        = string
  default     = "Kloud_Messiah"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name for the VPC"
  type        = string
  default     = "main"
}

variable "aws_internet_gateway" {
  description = "The name for the Internet Gateway"
  type        = string
  default     = "main-igw"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "route_table_name" {
  description = "the cidr block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}

variable "aws_security_group_name" {
  description = "the name for the security group"
  type        = string
  default     = "main-sg"
}

variable "instance_type" {
  description = "the instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "the name of the SSH key pair"
  type        = string
  default     = "terra_tut_key"
}

# variable "key_path" {
#   description = "the path to the SSH key pair"
#   type        = string
#   default     = "~/.ssh/terra_tut_key.pem"
# }

variable "owner" {
  description = "the owner of the project"
  type        = string
  default     = "Selorm"
}

variable "owner_email" {
  description = "the email of the owner"
  type        = string
  default     = "selormharry@gmail.com"
}