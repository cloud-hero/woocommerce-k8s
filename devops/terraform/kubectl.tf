resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = "kubectl apply -f istio/"
  }

  depends_on = [
    google_container_node_pool.primary_nodes,
    null_resource.istio,
  ]
}