module "training-vault" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> v2.0"

  domain_name = "vault.${var.hosted_zone}"
  zone_id     = var.hosted_zone_id

  validate_certificate = true
  validation_method    = "DNS"
}

module "training-jenkins" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> v2.0"

  domain_name = "jenkins.${var.hosted_zone}"
  zone_id     = var.hosted_zone_id

  validate_certificate = true
  validation_method    = "DNS"
}


