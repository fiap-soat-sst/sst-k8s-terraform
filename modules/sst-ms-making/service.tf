resource "kubernetes_service" "mking_api" {
  metadata {
    name      = "mking-api"
    namespace = "fiap-soat"

    labels = {
      app = "mking-api"
    }
  }

  spec {
    selector = {
      app = "mking-api"
    }

    type = "LoadBalancer"

    port {
      name        = "mking-api"
      port        = 80
      target_port = local.mking_port
      protocol    = "TCP"
    }
  }

  depends_on = [kubernetes_deployment.mking_api]
}
