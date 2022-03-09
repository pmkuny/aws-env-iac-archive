resource "aws_route53_record" "dev" {
  zone_id = var.hosted_zone_id
  name    = "dev.${var.hosted_zone}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.dev.public_ip}"]
}

