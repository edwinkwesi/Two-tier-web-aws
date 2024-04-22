# Creating VPC custom configuration
resource "aws_vpc" "my-vpc" {
  cidr_block        = "10.0.0.0/16"
  instance_tenancy  = "default"
tags = {
    Name = "the-my-vpc"
  }
}

#1st Public Subnet for the Web Server Tier
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1"
  }
}

#2nd Public Subnet for the Web Server Tier
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-2"
  }
}

#1st Private Subnet for the RDS Tier
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet-1"
  }
}

#2nd Private Subnet for the RDS Tier
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet-2"
  }
}