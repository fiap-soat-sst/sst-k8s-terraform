resource "aws_eks_cluster" "self_service_totem" {
  name     = "self-service-totem"
  role_arn = local.aws_arn

  vpc_config {
    subnet_ids              = module.vpc.private_subnets
    endpoint_private_access = true
  }

  tags = local.tags
}
