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

module "ELB" {
    source = "./ELB"
    instance-m = "module.EC2.instance"
    vpc-m = "module.EC2.vpc-id"
    sub-m1 = "module.EC2.sub-pub"
    sub-m2 = "module.EC2.sub-pri"
   
}
  
module "EC2" {
    source = "./EC2"
}




  
 /* 
module "VPC" {
    source = "./VPC"
}
    
module "RDS" {
  source  = "./RDS"
}*/
