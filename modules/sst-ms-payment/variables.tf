variable "payment_db_database" {
  default = "none"
  type    = string
}

variable "payment_db_host" {
  default = "none"
  type    = string
}

variable "payment_db_password" {
  default = "none"
  type    = string
}

variable "payment_db_port" {
  default = 27017
  type    = number
}

variable "payment_db_type" {
  default = "none"
  type    = string
}

variable "payment_db_username" {
  default = "none"
  type    = string
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
