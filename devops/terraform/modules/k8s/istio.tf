resource "null_resource" "istio" {
  provisioner "local-exec" {
    command = "istioctl install --set profile=preview"
  }

# Used to force dependency on GKE cluster.
  depends_on = [
    var.module_depends_on
  ]
}

resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = "kubectl apply -f modules/k8s/istio/"
  }

  depends_on = [
    null_resource.istio,
    null_resource.woocomm_ns,
    null_resource.monitoring_ns,
    null_resource.logging_ns,
  ]
}