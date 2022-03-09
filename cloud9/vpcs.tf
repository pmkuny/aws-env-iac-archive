module "cloud9" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_facts.name
  cidr = var.vpc_facts.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true

}