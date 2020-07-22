resource "null_resource" "istio" {
  provisioner "local-exec" {
    command = "istioctl install --set profile=preview"
  }
}