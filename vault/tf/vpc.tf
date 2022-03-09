module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.11.0"

  create_igw = true
  enable_nat_gateway = true

  name = local.project_name
  azs = ["us-west-2a", "us-west-2b", "us-west-2c"]
  cidr = "172.30.0.0/16"
  public_subnets = ["172.30.10.0/24", "172.30.20.0/24"]
  private_subnets = ["172.30.30.0/24", "172.30.40.0/24"]


}