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
    command = "helm repo add gitlab https://charts.gitlab.io"
  }

  provisioner "local-exec" {
    command = "helm repo update"
  }

# Used to force dependency on GKE cluster.
  depends_on = [
    var.module_depends_on
  ]
}