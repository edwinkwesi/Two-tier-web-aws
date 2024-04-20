# Two-tier-web-aws

This documentation illustrates Using Terraform to create a highly available two-tier AWS architecture with the following:

Custom VPC
2 public subnets for a Web Server Tier
2 private subnets for the RDS Tier
Private and public route tables
Launch an EC2 Instance with an Apache web-server in each public web tier subnet.
One RDS MySQL Instance (micro) in the private RDS subnets
Security Groups properly configured for web-servers, and the database.
Then we will deploy the configuration using Terraform Cloud as a CI/CD tool to check our build. We will Push our code to GitHub and include the links. Then we will use custom modules to build out our code for repeatability.

What we need:
AWS account

Terraform Cloud account so we can create a workspace in it and deploy a build. Type in your browser: app.terraform.io and set up your account.

What is Terraform Cloud?
Terraform Cloud allows a way for us to store our backend remotely in Terraform Cloud and deploy infrastructure known as runs. This makes it a great CI/CD pipeline tool for teams working on infrastructure. In Terraform Cloud we can create workspaces so we can have the ability to run tests on our different environments and specify specific versions of terraform we want to use for different environments. There are many other advantages to Terraform Cloud but these are the ones we will use for our project.

Modules
Modules are groups of Terraform files in a folder. This format makes our code reusable and easier to share. Modules save time and help minimize errors since we are not entering code in manually each time. We can simply enhance an existing module to fit our needed requirements. The module layout is designed with the parent module and child modules. The parent module main Terraform file is where we invoke the child modules. Following this format allows Terraform to read and pull from the modules to create real-world resources.

KEEP IN MIND
The internet gateway allows communication between resources in the VPC and the internet. The IG needs to be created first before the NAT Gateway (this will need a ‘depends_on’ argument).
The NAT Gateway is for private subnets to have a way to communicate within the VPC. The NAT Gateway is placed in a public subnet and associated with an elastic IP.
The subnets are in a single availability zone and are what we deploy our resources in. They have a range of IP addresses in our VPC.
Route Tables will be used to decide where network traffic from the subnets and gateways go.
For RDS DB instance, we need to specify where it will run by selecting the region.

# Terraform-doc Documentation

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_eip.elastic-for-ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.web_tier_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.web_tier_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.gw-nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.subnet1-private-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.subnet1-public-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.subnet2-private-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.subnet2-public-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.database_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.webtier_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.custom-vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"eu-west-2"` | no |
| <a name="input_az1"></a> [az1](#input\_az1) | n/a | `string` | `"eu-west-2a"` | no |
| <a name="input_az2"></a> [az2](#input\_az2) | n/a | `string` | `"eu-west-2b"` | no |
| <a name="input_db_pw"></a> [db\_pw](#input\_db\_pw) | n/a | `string` | `"passthebase"` | no |
| <a name="input_db_user"></a> [db\_user](#input\_db\_user) | n/a | `string` | `"dbadmin"` | no |
| <a name="input_ec2_instance_ami"></a> [ec2\_instance\_ami](#input\_ec2\_instance\_ami) | n/a | `string` | `"ami-0b9932f4918a00c4f"` | no |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | variables for ec2 | `string` | `"t2.micro"` | no |
