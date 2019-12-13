resource "aws_elb" "default" {
    name               = "wp-elb-tf"
    subnets            = ["aws_subnet.wp-public-tf.id","aws_subnet.wp-private-tf.id"]
    security_groups    = ["EC2/aws_security_group.wp-elb-tf.id"]

    listener {
        instance_port     = 80
        instance_protocol = "http"
        lb_port           = 80
        lb_protocol       = "http"
    }

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 5
        target              = "HTTP:80/index.html"
        interval            = 30
    }

    instances                   = ["EC2/aws_instance.ec2-instance.*.id"]
    cross_zone_load_balancing   = true
    idle_timeout                = 100
    connection_draining         = true
    connection_draining_timeout = 300
   
    tags = {
        Name = "Terra-ELB"
    }
}

######################################
#             VPC                    #
######################################

resource "aws_vpc" "default" {
    cidr_block = var.vpc_cidr_block

    tags = {
       Name = "Terra-VPC"
    }
}


######################################
#         Internet Gateway           #
######################################

resource "aws_internet_gateway" "default" {
    vpc_id = aws_vpc.default.id

    tags = {
       Name = "Terra-IG"
    }
}


######################################
#         Subnets                    #
######################################

resource "aws_subnet" "wp-public-tf" {
    vpc_id            = aws_vpc.default.id
    cidr_block        = var.public_subnet_cidr_block
    availability_zone = "us-west-2a"

    tags = {
       Name = "Terra-public-Sub"
    }
}


resource "aws_subnet" "wp-private-tf" {
    vpc_id            = aws_vpc.default.id
    cidr_block        = var.private_subnet_cidr_block
    availability_zone = "us-west-2b"

    tags = {
       Name = "Terra-private-Sub"
    }
}


######################################
#         Route Tables               #
######################################

resource "aws_route_table" "wp-rt-public-tf" {
    vpc_id = aws_vpc.default.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.default.id
    }

    tags = {
       Name = "Terra-RT"
    }
}

resource "aws_route_table_association" "wp-public-tf" {
    subnet_id = aws_subnet.wp-public-tf.id
    route_table_id = aws_route_table.wp-rt-public-tf.id
}



