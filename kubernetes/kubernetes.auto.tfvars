# VPC Handling
vpc_facts = {
  name = "Kubernetes"
  cidr = "10.40.0.0/16"
}

private_subnets = ["10.40.10.0/24", "10.40.20.0/24"]
public_subnets  = ["10.40.98.0/24","10.40.99.0/24"]
azs             = ["us-west-2a", "us-west-2b"]

