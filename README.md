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


