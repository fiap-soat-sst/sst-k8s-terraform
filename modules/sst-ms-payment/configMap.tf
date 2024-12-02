resource "kubernetes_config_map" "payment_env" {

  depends_on = [kubernetes_namespace.fiap_soat]
  metadata {
    name      = "payment-env"
    namespace = "fiap-soat"
  }

  data = {
    PORT            = var.payment_port
    SWAGGER_URL     = "localhost"
    URL_DEPLOY      = "http://34.95.232.166"
    URL_PAYMENT_API = "https://southamerica-east1-self-service-totem-428818.cloudfunctions.net/payment-fake"
  }
}
