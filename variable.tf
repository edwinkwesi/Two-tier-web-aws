# variable "aws_region" {
#   default = "eu-west-2"
  
# }

#variables for ec2
variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2_instance_ami" {
  type    = string
  default = "ami-0b9932f4918a00c4f"
}

variable "az1" {
  type    = string
  default = "eu-west-2a"
}

variable "az2" {
  type    = string
  default = "eu-west-2b"
}


variable "db_user" {
  type      = string
  default   = "dbadmin"
  sensitive = true
}

variable "db_pw" {
  type      = string
  default   = "passthebase"
  sensitive = true
}