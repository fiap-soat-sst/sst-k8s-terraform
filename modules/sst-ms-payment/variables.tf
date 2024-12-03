
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

variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "jwt_secret" {
  default = "none"
  type    = string
}

variable "x_api_key" {
  default = "none"
  type    = string
}

variable "order_service_url" {
  default = "none"
  type    = string
}