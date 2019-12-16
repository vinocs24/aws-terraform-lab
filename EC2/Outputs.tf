output "instance" {
  value = aws_instance.ec2-instance.id
}

output "id" {
  value = aws_vpc.default.id
}

output "subnet1-id" {
  value = aws_subnet.wp-public-tf.id
}

output "subnet1-cidr" {
  value = aws_subnet.wp-public-tf.cidr_block
}

output "subnet2-id" {
  value = aws_subnet.wp-private-tf.id
}

output "subnet2-cidr" {
  value = aws_subnet.wp-private-tf.cidr_block
}

output "security-group-db-id" {
  value = aws_security_group.wp-db-sg-tf.id
}

output "security-group-id" {
  value = aws_security_group.wp-elb-tf.id
}
