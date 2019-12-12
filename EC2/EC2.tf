# EC2 Instances

#module "ec2_cluster" {
 

resource "aws_instance" "ec2-instance" {
    source                      = "aws-terraform-lab/VPC/VPC"
    version                     = "~> 2.0"
    ami                         = var.ami
    instance_type               = var.instance_type
    availability_zone           = "us-west-2a"
    subnet_id                   = aws_subnet.wp-public-tf.id
    key_name                    = var.key_name
    associate_public_ip_address = true
    security_groups             = [aws_security_group.wp-sg-tf.id]
    user_data                   = file("EC2/installing-components.sh")
    tags = {
      Name = "ec2-instance"
    }
}
