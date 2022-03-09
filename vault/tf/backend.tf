
terraform {
  # storing statefile in S3
  backend "s3" {
    bucket = "terraform-2722ff3a-2ac3-4136-b2fd-05d4cb1dc480"
    region = "us-west-2"
    key    = "vault"

    dynamodb_table = "terraform"
    encrypt        = true
  }
}