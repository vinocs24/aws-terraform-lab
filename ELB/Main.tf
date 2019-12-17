resource "aws_elb" "default" {
    name               = "wp-elb-tf"
    subnets            = [var.subnet-pub]
    security_groups    = [var.security-group]

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
        target              = "HTTP:80/wp-admin/setup-config.php"
        interval            = 30
    }

    instances                   = [var.instance-id]
    cross_zone_load_balancing   = true
    idle_timeout                = 100
    connection_draining         = true
    connection_draining_timeout = 300
   
    tags = {
        Name = "Terra-ELB"
    }
}
