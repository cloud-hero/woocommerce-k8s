resource "null_resource" "autoscale_woocomm" {
  provisioner "local-exec" {
    command = "kubectl -n woocomm autoscale deploy woocommerce-wordpress --min=1 --max=6"
  }

  depends_on = [
    helm_release.woocommerce,
  ]
}