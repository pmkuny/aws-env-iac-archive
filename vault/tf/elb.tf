resource "aws_lb" "this" {
    name = "vault"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.load_balancer.id]
    subnets = module.vpc.public_subnets
    enable_deletion_protection = false
}