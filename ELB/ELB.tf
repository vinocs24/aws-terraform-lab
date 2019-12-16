resource "aws_elb" "default" {
    name               = "wp-elb-tf"
    subnets            = EC2[aws_subnet.wp-public-tf.id]
    security_groups    = EC2/[aws_security_group.wp-elb-tf.id]

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

    instances                   = "EC2/aws_instance.ec2-instance.*.id"
    cross_zone_load_balancing   = true
    idle_timeout                = 100
    connection_draining         = true
    connection_draining_timeout = 300
   
    tags = {
        Name = "wp-elb-tf"
    }
}




#resource "aws_lb_cookie_stickiness_policy" "wp-elb-tf-policy" {
  #  name                     = "wp-elb-tf-policy"
  #  load_balancer            = aws_elb.default.id
  #  lb_port                  = 80
  #  cookie_expiration_period = 600
#}


output "elb_dns" {
    value = [aws_elb.default.dns_name]
}
