# Placeholder for EC2 Host Nodes

#resource "aws_launch_template" "ecs_node" {
#    name_prefix = "ecs_node-"
#    block_device_mappings {
#      device_name = "/dev/sda1"
#      ebs {
#          volume_size = 20
#      }
#    }
#    instance_type = "t3.medium"
#    
#
#}
#
#resource "aws_instance" "ecs_nodes" {
#    count = 2
#}