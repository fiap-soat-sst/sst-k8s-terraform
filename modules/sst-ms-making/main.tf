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

variable "mking_db_database" {}
variable "mking_db_host" {}
variable "mking_db_password" {}
variable "mking_db_port" {}
variable "mking_db_type" {}
variable "mking_db_username" {}
variable "mking_port" {}