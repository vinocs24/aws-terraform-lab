resource "aws_db_subnet_group" "default" {
    name        = "wp-db-subnet-rds"
    description = "VPC Subnets"
    subnet_ids  = [var.subnet-pub, var.subnet-pri]
}

resource "aws_db_instance" "wordpress" {
    identifier             = "wordpress-tf"
    allocated_storage      = 5
    engine                 = "mysql"
    engine_version         = "5.7.22"
    port                   = "3306"
    instance_class         = var.db_instance_type
    name                   = var.db_name
    username               = var.db_user
    password               = var.db_password
    availability_zone      = "us-west-2b"
    vpc_security_group_ids = [var.security-group-db]
    multi_az               = false
    db_subnet_group_name   = aws_db_subnet_group.default.id
    parameter_group_name   = "default.mysql5.7"
    publicly_accessible    = false
}
