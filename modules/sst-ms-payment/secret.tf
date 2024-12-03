resource "kubernetes_secret" "payment_api_secrets" {
  metadata {
    name      = "payment-api-secrets"
    namespace = "fiap-soat"
  }

  data = {
    DB_PORT     = 27017
    PORT        = 3001
    NOTIFICATION_URL = var.payment_notification_url
    URL_PAYMENT_QR_MERCADO_PAGO = var.payment_qr_mercado_pago
    JWT_SECRET = var.jwt_secret
    AWS_REGION = var.aws_region
    X_API_KEY = var.x_api_key
    ORDER_SERVICE_URL = var.order_service_url
  }

  type = "Opaque"
}
