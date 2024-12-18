resource "kubernetes_secret" "sst_api_secrets" {
  metadata {
    name      = "sst-api-secrets"
    namespace = "fiap-soat"
  }

  data = {
    DB_DATABASE = var.sst_db_database
    DB_HOST     = var.sst_db_host
    DB_PASSWORD = var.sst_db_password
    DB_PORT     = 3306
    DB_TYPE     = var.sst_db_type
    DB_USERNAME = var.sst_db_username
    PORT        = 3000
    BASE_URL_MAKING    = var.ms_making_url 
    BASE_URL_PAYMENT  = var.ms_payment_url
    JWT_SECRET = var.jwt_secret
  }

  type = "Opaque"

  depends_on = [kubernetes_namespace.fiap_soat]
}
