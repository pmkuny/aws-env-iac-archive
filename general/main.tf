terraform {
  # storing statefile in S3
  backend "s3" {
    bucket = "terraform-2722ff3a-2ac3-4136-b2fd-05d4cb1dc480"
    region = "us-west-2"
    key    = "sandbox"

    dynamodb_table = "terraform"
    encrypt        = true
  }
  required_providers {
    # used for random number, string, server name generation
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
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
      Slice   = "Sandbox/General"
    }
  }


}
