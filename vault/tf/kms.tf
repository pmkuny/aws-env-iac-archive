resource "aws_kms_key" "ecs_key" {
    description = "Key used for ECS Client/Container Encryption"
}

data "aws_iam_policy_document" "kms_key_policy" {
    statement {
        actions = ["kms:*"]
        resources = [aws_kms_key.ecs_key.arn]
        effect = "Allow"
        principals {
            type = "Service"
            identifiers = ["ecs.amazonaws.com"]
        }
    }

}