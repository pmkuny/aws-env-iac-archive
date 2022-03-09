resource "aws_eks_cluster" "this" {
# Role and correct policy needs to be in place before creating the cluster
    depends_on = [
      aws_iam_role.eks_cluster_role
    ]

    name = "Development"
    role_arn = aws_iam_role.eks_cluster_role.arn

    vpc_config {
      subnet_ids = var.cluster_subnet_ids
    }
}