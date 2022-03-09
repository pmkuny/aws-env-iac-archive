resource "aws_ecs_task_definition" "vault_definition" {
    family = "vault"
    container_definitions = file("container_definitions/vault.json")

    requires_compatibilities = ["FARGATE"]
    network_mode = "awsvpc"
    execution_role_arn = aws_iam_role.vault_task.arn

    # Definitions at the task level required by Fargate
    # Fargate tasks require a certain combination of CPU and Memory settings
    cpu = "256"
    memory = "1024"

    volume {
        name = "logs"
        host_path = "/vault/logs/"
    }

    volume {
        name = "config"
        host_path = "/vault/config/"
    }


}
