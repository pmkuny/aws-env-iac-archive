resource "aws_ecs_cluster" "primary_ecs_cluster" {
    name = "primary_cluster"

    configuration {
      execute_command_configuration {
          kms_key_id = aws_kms_key.ecs_key.key_id
          logging = "OVERRIDE"
      
        log_configuration {
            cloud_watch_log_group_name = aws_cloudwatch_log_group.ecs.name
        }
      }
    }
}
