terraform {
  # storing statefile in S3
  backend "s3" {
    bucket = "terraform-2722ff3a-2ac3-4136-b2fd-05d4cb1dc480"
    region = "us-west-2"
    key    = "cicd"

    # DynamoDB Table for locking access to state file
    dynamodb_table = "terraform"
    encrypt        = true
  }
  required_providers {
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
      Slice   = "CICD"
    }
  }
}
