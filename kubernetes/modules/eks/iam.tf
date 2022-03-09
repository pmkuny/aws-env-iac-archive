# EKS requires a role with the AmazonEKSClusterPolicy attached:
# https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html
# The ARN for that Amazon-managed policy is arn:aws:iam::aws:policy/AmazonEKSClusterPolicy

resource "aws_iam_role" "eks_cluster_role" {
    name = "EksClusterRole"

    assume_role_policy = data.aws_iam_policy_document.eks_cluster_role.json
    managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"]
}