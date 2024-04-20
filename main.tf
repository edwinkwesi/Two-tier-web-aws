terraform {
  cloud {
    organization = "edwinkwesi"

    workspaces {
      name = "two-tier-arch"
    }
  }
  required_providers {
    aws = {
      version = "~> 5.0.0"
    }
  }
}

#Configure AWS provider
provider "aws" {
  region = "eu-west-2"
  shared_credentials_files = ["~/.aws/credentials"]
#   profile = 339713089708

}

module "backend_modules" {
  source = "./backend_modules"

  
}


output "publicip1" {
    value = "module.backend_modules.aws_instance.web_tier_1.public_ip.id"
}

output "publicip2" {
    value = "module.backend_modules.aws_instance.web_tier_2.public_ip.id"
}

# output of public ip id's
