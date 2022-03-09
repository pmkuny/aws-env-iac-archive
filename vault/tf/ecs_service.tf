resource "aws_ecs_service" "this" {
    name = "vault"
    cluster = aws_ecs_cluster.primary_ecs_cluster.id
    task_definition = aws_ecs_task_definition.vault_definition.arn
    desired_count = 3
    enable_ecs_managed_tags = true
    launch_type = "FARGATE"

    network_configuration {
      subnets = module.vpc.private_subnets
    }
}