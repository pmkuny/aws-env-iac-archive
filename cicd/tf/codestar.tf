# Define our connection through CodeStar to our Github Repository. This will need to be manually approved in the Console after creation.
resource "aws_codestarconnections_connection" "codestarconnections_connection" {
  name          = "GithubSource"
  provider_type = "GitHub"
}