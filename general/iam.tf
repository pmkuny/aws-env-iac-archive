
# Lambda: OrganizationPractice Role
resource "aws_iam_role" "OrganizationPractice_role" {
  name = "OrganizationPracticeRole"
  path = "/external/"

  assume_role_policy = file("iam_json/OrganizationPractice_role/OrganizationPractice_role_assume_role_policy.json")

}

resource "aws_iam_policy" "OrganizationPractice_role_policy" {
  name   = "OrganizationPracticeRolePolicy"
  policy = file("iam_json/OrganizationPractice_role/OrganizationPractice_role_policy.json")
}

resource "aws_iam_policy_attachment" "OrganizationPractice_role_attach" {
  name       = "OrganizationPracticeRoleAttach"
  roles      = ["${aws_iam_role.OrganizationPractice_role.name}"]
  policy_arn = aws_iam_policy.OrganizationPractice_role_policy.arn
}

# Lambda: Instance Scheduler Role
resource "aws_iam_role" "InstanceScheduler_role" {
  name = "InstanceSchedulerRole"
  path = "/utilities/"

  assume_role_policy = file("iam_json/InstanceScheduler_role/InstanceScheduler_role_assume_role_policy.json")

}

resource "aws_iam_policy" "InstanceScheduler_role_policy" {
  name   = "InstanceSchedulerRolePolicy"
  policy = file("iam_json/InstanceScheduler_role/InstanceScheduler_role_policy.json")
}

resource "aws_iam_policy_attachment" "InstanceScheduler_role_attach" {
  name       = "InstanceSchedulerRoleAttach"
  roles      = ["${aws_iam_role.InstanceScheduler_role.name}"]
  policy_arn = aws_iam_policy.InstanceScheduler_role_policy.arn
}

module "iam_roles" {
  source = "../../modules/iam"

  slice = "Sandbox"
}