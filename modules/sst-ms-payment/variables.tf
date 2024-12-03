
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