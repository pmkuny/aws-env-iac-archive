# VPC Handling
vpc_facts = {
  name = "General"
  cidr = "10.10.0.0/16"
}

private_subnets = ["10.10.10.0/24", "10.10.11.0/24"]
public_subnets  = ["10.10.99.0/24"]
azs             = ["us-west-2a", "us-west-2b"]

iam_role = "SandboxInstanceRole"
