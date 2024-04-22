resource "aws_instance" "web_tier_1" {
  ami                    = var.ec2_instance_ami
  instance_type          = var.ec2_instance_type
  availability_zone      = "eu-west-2a"
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.webtier_sg.id, aws_security_group.sg.id]
  user_data              = file("/Users/edwinamoo/Terraform/TwoTier-Architecture/backend_modules/install_apache.sh")

  tags = {
    Name = "web_tier_in_2a"
  }
}

resource "aws_instance" "web_tier_2" {
  ami                    = var.ec2_instance_ami
  instance_type          = var.ec2_instance_type
  availability_zone      = "eu-west-2b"
  subnet_id              = aws_subnet.public_subnet_2.id
  vpc_security_group_ids = [aws_security_group.webtier_sg.id, aws_security_group.sg.id]
  user_data              = file("/Users/edwinamoo/Terraform/TwoTier-Architecture/backend_modules/install_apache.sh")

  tags = {
    Name = "web_tier_in_2b"
  }
}