# EC2 Instances

resource "aws_instance" "ec2-instance" {
    ami                         = var.ami
    instance_type               = var.instance_type
    availability_zone           = "us-west-2a"
    subnet_id                   = "module.VPC.aws_subnet.wp-public-tf.id"
    key_name                    = var.key_name
    associate_public_ip_address = true
    security_groups             = [aws_security_group.wp-sg-tf.id]
    user_data                   = file("EC2/installing-components.sh")
    tags = {
      Name = "ec2-instance"
    }
}


# SG

resource "aws_security_group" "wp-sg-tf" {
  name        = "wp-instance-tf"
  description = "Security group for EC2 Instances"
  vpc_id      = "module.VPC.aws_vpc.default.id"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wp-sg-tf"
  }
}
