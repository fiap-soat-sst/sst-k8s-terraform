resource "kubernetes_deployment" "mking_api" {

  depends_on = [kubernetes_namespace.fiap_soat, kubernetes_config_map.mking_env, kubernetes_secret.mking_api_secrets]

  metadata {
    name      = "mking-api"
    namespace = "fiap-soat"
    labels = {
      app = "mking-api"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mking-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "mking-api"
        }
      }

      spec {
        container {
          name  = "mking-api"
          image = "${local.image_name}:${local.image_version}"

          env_from {
            secret_ref {
              name = "mking-api-secrets"
            }
          }

          env_from {
            config_map_ref {
              name = "mking-env"
            }
          }

          port {
            container_port = local.mking_port
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
              port = local.mking_port
            }

            period_seconds    = 5
            success_threshold = 1
            failure_threshold = 1
            timeout_seconds   = 1
          }

          readiness_probe {
            http_get {
              path = "/public/docs"
              port = local.mking_port
            }

            period_seconds    = 3
            success_threshold = 1
            failure_threshold = 1
            timeout_seconds   = 1
          }

          startup_probe {
            http_get {
              path = "/public/docs"
              port = local.mking_port
            }

            period_seconds        = 3
            failure_threshold     = 30
            initial_delay_seconds = 30
          }
        }

        init_container {
          name  = "migrate"
          image = "${local.image_name}:${local.image_version}"

          command = ["npm", "run", "migration:up"]

          env_from {
            secret_ref {
              name = "mking-api-secrets"
            }
          }

          env_from {
            config_map_ref {
              name = "mking-env"
            }
          }
        }
      }
    }
  }
}
