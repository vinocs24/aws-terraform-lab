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

module "EC2" {
    source = "./EC2"
}
  
module "ELB" {
    source = "./ELB"
    vpc-id          = module.EC2.id
    subnet-pub      = module.EC2.subnet1-id
    security-group  = module.EC2.security-group-id
    instance-id     = module.EC2.instance  
  
}
  
  
module "RDS" {
  source  = "./RDS"
  vpc-id              = module.EC2.id
  subnet-pub          = module.EC2.subnet1-id
  subnet-pri          = module.EC2.subnet2-id 
  security-group-db   = module.security-group-db-id
}
