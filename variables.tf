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

variable "payment_port" {
  default = 3225
  type    = number
}

variable "payment_notification_url" {
  default = "none"
  type    = string
}

variable "payment_qr_mercado_pago" {
  default = "none"
  type    = string
}

variable "AWS_REGION" {
  default = "us-east-1"
  type    = string
}

variable "mking_db_database" {
  default = "none"
  type    = string
}

variable "mking_db_host" {
  default = "none"
  type    = string
}

variable "mking_db_password" {
  default = "none"
  type    = string
}

variable "mking_db_port" {
  default = 3306
  type    = number
}

variable "mking_db_type" {
  default = "none"
  type    = string
}

variable "mking_db_username" {
  default = "none"
  type    = string
}

variable "mking_port" {
  default = 3125
  type    = number
}

variable "ms_making_url" {
  default = "none"
  type    = string
}

variable "ms_payment_url" {
  default = "none"
  type    = string
}

variable "jwt_secret" {
  default = "none"
  type    = string
}