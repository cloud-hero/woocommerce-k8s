resource "null_resource" "set_cluster" {
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.project_id}-gke --region europe-west3"
  }

  depends_on = [
    google_container_node_pool.primary_nodes,
  ]
}