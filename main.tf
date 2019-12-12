# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "terraform-lab-demo"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}

# Use AWS Terraform provider
provider "aws" {
  region = "us-west-2"
}

module "VPC" {
    source = "./VPC"
}

module "EC2" {
    source = "./EC2"
    vpc_id                   = "module.VPC.id"
    subnet_id_wa             = "module.VPC.subnet_pub"
    security_groups_wa       = "module.vpc.security_groups_1"
}

  /*
module "ELB" {
    source = "./ELB"
}

module "RDS" {
  source  = "./RDS"
}*/
