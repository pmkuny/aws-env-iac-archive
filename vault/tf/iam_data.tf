data "aws_iam_policy_document" "vault_task_assume_role_policy" {
    statement {
        actions = ["sts:AssumeRole"]
        effect = "Allow"
        principals {
          type = "Service"
          identifiers = ["ecs.amazonaws.com","ecs-tasks.amazonaws.com"]
        }
    }
}

# Role is needed by Vault task to handle automatic creation of CloudWatch Log Stream via awslogs driver within the ECS task
data "aws_iam_policy_document" "vault_task_role_policy" {
    statement {
        actions = [
            "logs:CreateLogStream",
            "logs:PutLogEvents",
            "logs:CreateLogGroup"
        ]
        resources = ["*"]
    }
}