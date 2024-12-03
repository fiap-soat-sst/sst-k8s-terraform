variable "sst_db_database" {
  default = "self-service-totem"
  type    = string
}

variable "sst_db_host" {
  default = "none"
  type    = string
}

variable "sst_db_password" {
  default = "none"
  type    = string
}

variable "sst_db_port" {
  default = 3306
  type    = number
}

variable "sst_db_type" {
  default = "mysql"
  type    = string
}

variable "sst_db_username" {
  default = "sst-manager"
  type    = string
}

variable "sst_port" {
  default = 3000
  type    = number
}
