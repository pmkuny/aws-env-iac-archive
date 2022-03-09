resource "aws_iam_role" "vault_task" {
    name = "VaultTaskRole"
    assume_role_policy = data.aws_iam_policy_document.vault_task_assume_role_policy.json

    managed_policy_arns = [aws_iam_policy.vault_task_role_policy.arn]
} 

resource "aws_iam_policy" "vault_task_role_policy" {
    name = "VaultTaskRolePolicy"
    policy = data.aws_iam_policy_document.vault_task_role_policy.json
}