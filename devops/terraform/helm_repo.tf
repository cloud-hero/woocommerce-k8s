resource "null_resource" "helm_repo" {
  provisioner "local-exec" {
    command = "helm repo add stable https://kubernetes-charts.storage.googleapis.com"
  }

  provisioner "local-exec" {
    command = "helm repo add elastic https://helm.elastic.co"
  }

  provisioner "local-exec" {
    command = "helm repo add bitnami https://charts.bitnami.com/bitnami"
  }

  provisioner "local-exec" {
    command = "helm repo update"
  }

  depends_on = [
    null_resource.set_cluster,
  ]
}