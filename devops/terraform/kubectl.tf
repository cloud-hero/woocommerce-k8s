resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = "kubectl apply -f istio/"
  }
}