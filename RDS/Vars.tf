variable "vpc-id" {}
variable "subnet-pub" {}
variable "subnet-pri" {}
variable "security-group-db" {}


variable "db_instance_type" {
  description = "RDS instance type"
  default = "db.t2.micro"
}

variable "db_name" {
  description = "RDS DB name"
  default = "wordpresstest"
}

variable "db_user" {
  description = "RDS DB username"
  default = "vinoth"
}

variable "db_password" {
  description = "RDS DB password"
  default = "Vino@123"
}

variable "wp_title" {
  description = "Wordpress title"
  default = "My Wordpress on Terraform"
}

variable "wp_user" {
  description = "Wordpress username"
  default = "admin"
}

variable "wp_password" {
  description = "Wordpress password"
  default = "Vino@123"
}

variable "wp_mail" {
  description = "Wordpress email"
  default = "vinocs24@gmail.com"
}
