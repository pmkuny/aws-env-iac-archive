terraform {
  # storing statefile in S3
  backend "s3" {
    bucket = "terraform-2722ff3a-2ac3-4136-b2fd-05d4cb1dc480"
    region = "us-west-2"
    key    = "kubernetes"

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
      Slice   = "Development/Kubernetes"
    }
  }


}


module "eks" {
  source = "./modules/eks"

  cluster_subnet_ids = module.vpc.private_subnets

depends_on = [
  module.vpc
]

}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~>3.11"

  name = var.vpc_facts.name
  cidr = var.vpc_facts.cidr

  private_subnets = ["10.40.10.0/24", "10.40.20.0/24"]
  public_subnets  = ["10.10.98.0/24","10.10.99.0/24"]
  azs             = ["us-west-2a", "us-west-2b"]

}