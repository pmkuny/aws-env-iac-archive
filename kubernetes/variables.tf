variable "vpc_facts" { type = map(any) }
variable "private_subnets" { type = list(any) }
variable "public_subnets" { type = list(any) }
variable "azs" { type = list(any) }

variable "local_ip" {
  type      = list(string)
  sensitive = true
}


# LTS version of Amazon Linux 2
variable "aws_ami_id" {
  type    = string
  default = "ami-0cf6f5c8a62fa5da6"
}
