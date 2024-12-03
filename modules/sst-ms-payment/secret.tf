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
  }

  type = "Opaque"
}
