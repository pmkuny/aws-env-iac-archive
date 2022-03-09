resource "aws_security_group" "load_balancer" {
    name = "load_balancer" 
    description = "Allow Public Traffic to Load Balancer"
    vpc_id = module.vpc.vpc_id

    ingress {
        description = "Allow ingress for HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [var.local_ip]
    }

    egress {
        description = "Allow egress"
        from_port = 0
        to_port = 0
        protocol = "all"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

}
resource "aws_security_group" "vault" {
    name = "vault"
    description = "Allow traffic to Vault and from Vault"
    vpc_id = module.vpc.vpc_id

    ingress {
        description = "HTTP from LB"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = [aws_security_group.load_balancer.id]
    }

    egress {
        description = "Allow egress"
        from_port = 0
        to_port = 0
        protocol = "all"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

}