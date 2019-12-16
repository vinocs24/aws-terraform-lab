variable "region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "key_name" {
  description = "SSH key name to access the EC2 instances"
  default     = "rds-key"
}

variable "vpc_cidr_block" {
  description = "VPC network"
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "Public Subnet"
  default     = "10.1.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "Private Subnet"
  default     = "10.1.2.0/24"
}

variable "availability_zones" {
  description = "Availability Zones"
  default     = "us-west-2a,us-west-2b,us-west-2c"
}

variable "ami" {
  description = "EC2 Instances AMIs"
  default = "ami-08d489468314a58df"
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}
