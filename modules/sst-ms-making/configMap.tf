resource "kubernetes_config_map" "mking_env" {

  metadata {
    name      = "mking-env"
    namespace = "fiap-soat"
  }

  data = {
    PORT            = var.mking_port
    SWAGGER_URL     = "localhost"
    URL_DEPLOY      = "http://34.95.232.166"
    URL_PAYMENT_API = "https://southamerica-east1-self-service-totem-428818.cloudfunctions.net/payment-fake"
  }
}
