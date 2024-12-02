resource "kubernetes_secret" "sst_api_secrets" {
  metadata {
    name      = "sst-api-secrets"
    namespace = kubernetes_namespace.fiap_soat.metadata[0].name
  }

  data = {
    DB_DATABASE = var.sst_db_database
    DB_HOST     = var.sst_db_host
    DB_PASSWORD = var.sst_db_password
    DB_PORT     = 3306
    DB_TYPE     = var.sst_db_type
    DB_USERNAME = var.sst_db_username
    PORT        = 3000
  }

  type = "Opaque"

  depends_on = [kubernetes_namespace.fiap_soat]
}
