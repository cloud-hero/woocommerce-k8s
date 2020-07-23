resource "null_resource" "istio" {
  provisioner "local-exec" {
    command = "istioctl install --set profile=preview"
  }

  depends_on = [
    google_container_node_pool.primary_nodes,
  ]
}