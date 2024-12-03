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
