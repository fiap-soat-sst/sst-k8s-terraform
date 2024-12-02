resource "kubernetes_deployment" "payment_api" {

  depends_on = [kubernetes_namespace.fiap_soat, kubernetes_config_map.payment_env, kubernetes_secret.payment_api_secrets]

  metadata {
    name      = "payment-api"
    namespace = "fiap-soat"
    labels = {
      app = "payment-api"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "payment-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "payment-api"
        }
      }

      spec {
        container {
          name  = "payment-api"
          image = "${local.image_name}:${local.image_version}"

          env_from {
            secret_ref {
              name = "payment-api-secrets"
            }
          }

          env_from {
            config_map_ref {
              name = "payment-env"
            }
          }

          port {
            container_port = local.payment_port
          }

          resources {
            limits = {
              cpu    = "2"
              memory = "2Gi"
            }

            requests = {
              cpu    = "300m"
              memory = "128Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/public/docs"
              port = local.payment_port
            }

            period_seconds    = 5
            success_threshold = 1
            failure_threshold = 1
            timeout_seconds   = 1
          }

          readiness_probe {
            http_get {
              path = "/public/docs"
              port = local.payment_port
            }

            period_seconds    = 3
            success_threshold = 1
            failure_threshold = 1
            timeout_seconds   = 1
          }

          startup_probe {
            http_get {
              path = "/public/docs"
              port = local.payment_port
            }

            period_seconds        = 3
            failure_threshold     = 30
            initial_delay_seconds = 30
          }
        }
      }
    }
  }
}
