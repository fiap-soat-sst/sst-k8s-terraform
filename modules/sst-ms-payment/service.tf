resource "kubernetes_service" "payment_api" {
  metadata {
    name      = "payment-api"
    namespace = kubernetes_namespace.fiap_soat.metadata[0].name

    labels = {
      app = "payment-api"
    }
  }

  spec {
    selector = {
      app = "payment-api"
    }

    type = "LoadBalancer"

    port {
      name        = "payment-api"
      port        = 80
      target_port = local.payment_port
      protocol    = "TCP"
    }
  }

  depends_on = [kubernetes_deployment.payment_api, kubernetes_namespace.fiap_soat]
}
