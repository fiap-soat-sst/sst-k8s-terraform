terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.67.0"
    }
  }
  cloud {
    organization = "sst-fiap-soat"
    workspaces {
      name = "sst-k8s-terraform"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.self_service_totem.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.self_service_totem.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.self_service_totem.token
}

module "self_service_totem" {
  source = "./modules/self-service-totem"
}

module "sst-ms-making" {
  source = "./modules/sst-ms-making"
}