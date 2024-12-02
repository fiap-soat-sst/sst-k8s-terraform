locals {
  region   = "us-east-1"
  name     = "sst-ms-making"
  image_name     = "evilfeeh/sst-ms-making"
  image_version = "latest"
  mking_port = 3125
  

  tags = {
    "kubernetes.io/cluster/${local.name}" = "shared"
  } 
}