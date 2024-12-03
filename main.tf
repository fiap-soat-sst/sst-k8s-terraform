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
  sst_db_database= var.sst_db_database
  sst_db_host = var.sst_db_host
  sst_db_password = var.sst_db_password
  sst_db_port = var.sst_db_port
  sst_db_type = var.sst_db_type
  sst_db_username = var.sst_db_username
  sst_port = var.sst_port
}

module "sst-ms-making" {
  source = "./modules/sst-ms-making"
  mking_db_database = var.mking_db_database
  mking_db_host = var.mking_db_host
  mking_db_password = var.mking_db_password
  mking_db_port = var.mking_db_port
  mking_db_type = var.mking_db_type
  mking_db_username = var.mking_db_username
  mking_port = var.mking_port
}

module "sst-ms-payment" {
  source = "./modules/sst-ms-payment"
  payment_port = var.payment_port
  payment_notification_url = var.payment_notification_url
  payment_qr_mercado_pago = var.payment_qr_mercado_pago
  AWS_REGION = var.AWS_REGION
}