locals {
  region   = "us-east-1"
  name     = "sst-ms-payment"
  image_name     = "evilfeeh/sst-ms-payment"
  image_version = "latest"
  payment_port = 3225
  

  tags = {
    "kubernetes.io/cluster/${local.name}" = "shared"
  } 
}


variable "payment_port" {}
variable "payment_notification_url" {}
variable "payment_qr_mercado_pago" {}
variable "AWS_REGION" {}