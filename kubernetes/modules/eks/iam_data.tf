
data "aws_iam_policy_document" "eks_cluster_role" {
    statement {
        actions = ["sts:AssumeRole"]
        effect = "Allow"
        principals {
          type = "Service"
          identifiers = ["eks.amazonaws.com"]
        }
    }
}