terraform {
  required_providers {
    # used for random number, string, server name generation
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1" 
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      Managed = "Terraform"
      Slice   = "Development/Vault"
    }
  }
}

