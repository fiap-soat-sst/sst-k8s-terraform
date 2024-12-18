resource "kubernetes_horizontal_pod_autoscaler" "mking_api_hpa" {
  metadata {
    name      = "mking-api-hpa"
    namespace = "fiap-soat"
  }

  spec {
    max_replicas = 10
    min_replicas = 1

    target_cpu_utilization_percentage = 70

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = kubernetes_deployment.mking_api.metadata[0].name
    }
  }

}
