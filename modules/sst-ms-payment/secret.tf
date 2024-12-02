resource "kubernetes_secret" "payment_api_secrets" {
  metadata {
    name      = "payment-api-secrets"
    namespace = kubernetes_namespace.fiap_soat.metadata[0].name
  }

  data = {
    DB_DATABASE = var.payment_db_database
    DB_HOST     = var.payment_db_host
    DB_PASSWORD = var.payment_db_password
    DB_PORT     = 27017
    DB_TYPE     = var.payment_db_type
    DB_USERNAME = var.payment_db_username
    PORT        = 3001
    NOTIFICATION_URL = var.payment_notification_url
    URL_PAYMENT_QR_MERCADO_PAGO = var.payment_qr_mercado_pago
  }

  type = "Opaque"

  depends_on = [kubernetes_namespace.fiap_soat]
}
