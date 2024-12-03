locals {
  region   = "us-east-1"
  name     = "self-service-totem"
  image_name     = "evilfeeh/self-service-totem"
  image_version = "latest"
  sst_port = 3000
}

variable "sst_db_database" {}
variable "sst_db_host" {}
variable "sst_db_password" {}
variable "sst_db_port" {}
variable "sst_db_type" {}
variable "sst_db_username" {}
variable "sst_port" {}