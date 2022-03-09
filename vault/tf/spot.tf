# Data source for AMI: we want to use the latest Amazon-ECS optimized image
# Corresponds to amzn-ami-2017.09.k-amazon-ecs-optimized
data "aws_ami" "ecs" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn-ami-2017.09.k-amazon-ecs-optimized"]
    }

}

# Providing a launch template for our Spot Fleet
resource "aws_launch_template" "ecs_spot" {
    name = "EcsSpotTemplate"

    block_device_mappings {
        
    }
}

# Setting up our Spot Fleet Request
