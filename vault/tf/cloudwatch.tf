resource "aws_cloudwatch_log_group" "ecs" {
    name = "ecs_vault_cluster"
    retention_in_days = 30
}