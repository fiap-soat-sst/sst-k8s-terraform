
data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.self_service_totem.name
}

data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.self_service_totem.name
}

data "aws_availability_zones" "available" {}

data "aws_eks_cluster" "self_service_totem" {
  name = aws_eks_cluster.self_service_totem.name
}

data "aws_eks_cluster_auth" "self_service_totem" {
  name = aws_eks_cluster.self_service_totem.name
}

data "aws_iam_role" "existing_lambda_role" {
  name = "LabRole"
}