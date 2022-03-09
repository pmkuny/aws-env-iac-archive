# VPC Handling
vpc_facts = {
  name = "Cloud9"
  cidr = "10.10.0.0/16"
}

private_subnets = ["10.10.10.0/24"]
public_subnets = ["10.10.98.0/24","10.10.99.0/24"]
azs             = ["us-west-2a", "us-west-2b"]

iam_role = "SandboxInstanceRole"
