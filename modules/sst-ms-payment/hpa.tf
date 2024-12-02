resource "kubernetes_horizontal_pod_autoscaler" "payment_api_hpa" {
  metadata {
    name      = "payment-api-hpa"
    namespace = kubernetes_namespace.fiap_soat.metadata[0].name
  }

  spec {
    max_replicas = 10
    min_replicas = 1

    target_cpu_utilization_percentage = 70

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = kubernetes_deployment.payment_api.metadata[0].name
    }
  }

  depends_on = [kubernetes_namespace.fiap_soat]
}