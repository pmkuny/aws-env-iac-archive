resource "aws_instance" "training-jenkins-01" {
  ami                  = var.aws_ami_id
  instance_type        = "t3.micro"
  iam_instance_profile = var.iam_role
  subnet_id            = module.general.private_subnets[0]

  # Jenkins Bootstrapping
  user_data = file("helpers/jenkins_bootstrap.sh")

  # Security Groups
  vpc_security_group_ids = ["${aws_security_group.management_access.id}"]

  tags = {
    Name = "training-jenkins"
  }
}


resource "aws_instance" "dev_instance" {
  ami                  = var.aws_ami_id
  instance_type        = "t3.micro"
  iam_instance_profile = var.iam_role
  subnet_id            = module.general.private_subnets[0]

  user_data = file("helpers/dev_instance/dev_bootstrap.sh")

  # Security Groups
  vpc_security_group_ids = ["${aws_security_group.management_access.id}"]

  tags = {
    Name = "dev.${var.hosted_zone}"
  }
}


# EIP for the dev instance - will be used for DNS
resource "aws_eip" "dev" {
  instance = aws_instance.dev_instance.id
  vpc      = true

}



# Testing for-each
resource "aws_instance" "training" {
  ami                  = var.aws_ami_id
  instance_type        = "t3.micro"
  iam_instance_profile = var.iam_role
  subnet_id            = module.general.private_subnets[0]

  # Security Groups
  vpc_security_group_ids = ["${aws_security_group.management_access.id}"]

  for_each = toset(["training-vault", "training-prometheus"])

  tags = {
    Name = each.key
  }
}

resource "aws_instance" "ansible-control-node" {
  ami                  = var.aws_ami_id
  instance_type        = "t3.micro"
  iam_instance_profile = var.iam_role
  subnet_id            = module.general.private_subnets[0]

  vpc_security_group_ids = ["${aws_security_group.management_access.id}"]

  tags = {
    Name = "ansible-control-node"
  }
}

