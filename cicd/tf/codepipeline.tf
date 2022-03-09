# S3 pipeline to execute testing our TF code
# No artifact output here, not needed, though we will need to capture output logs

resource "aws_codepipeline" "this" {
  name = "tf-pipeline"

# Three Stages
# Stage 1: Soruce from Github
# Stage 2: Build and Capture Output
# Stage 3: Commit? 


# Stage 1: Source
# We connect to Github through the CodeStar Connection we already have and use the aws-env repository
# This is where project path and project name are important as variables.

}