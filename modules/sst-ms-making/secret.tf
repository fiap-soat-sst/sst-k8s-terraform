resource "kubernetes_secret" "mking_api_secrets" {
  metadata {
    name      = "mking-api-secrets"
    namespace = "fiap-soat"
  }

  data = {
    DB_DATABASE = var.mking_db_database
    DB_HOST     = var.mking_db_host
    DB_PASSWORD = var.mking_db_password
    DB_PORT     = 3306
    DB_TYPE     = var.mking_db_type
    DB_USERNAME = var.mking_db_username
    PORT        = 3000
  }

  type = "Opaque"
}
