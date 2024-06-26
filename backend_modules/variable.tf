variable "aws_region" {
  default = "eu-west-2"
  #   type = string
}

#variables for ec2
variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2_instance_ami" {
  type    = string
  default = "ami-0b9932f4918a00c4f"
}

# variable "vpc_cidr" {
#   type    = string
# #   default = "10.0.0.0/17"
# }

# variable "az1" {
#   # type    = string
#   default = "eu-west-2"
# }

# variable "az2" {
#   # type    = string
#   default = "eu-west-2"
# }

# variable "public_subnet1_cidr" {
#   type    = string
#   default = "10.0.1.0/24"
# }

# variable "public_subnet2_cidr" {
#   type    = string
#   default = "10.0.2.0/24"
# }

# variable "private_subnet1_cidr" {
#   type    = string
#   default = "10.0.3.0/24"
# }

# variable "private_subnet2_cidr" {
#   type    = string
#   default = "10.0.4.0/24"
# }

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