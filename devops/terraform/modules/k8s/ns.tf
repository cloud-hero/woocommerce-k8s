resource "null_resource" "logging_ns" {
  provisioner "local-exec" {
    command = "kubectl create ns logging"
  }

# Used to force dependency on GKE cluster.
  depends_on = [
    var.module_depends_on
  ]
}  

resource "null_resource" "monitoring_ns" {
  provisioner "local-exec" {
    command = "kubectl create ns monitoring"
  }

# Used to force dependency on GKE cluster.
  depends_on = [
    var.module_depends_on
  ]
}

resource "null_resource" "woocomm_ns" {
  provisioner "local-exec" {
    command = "kubectl create ns woocomm"
  }

# Used to force dependency on GKE cluster.
  depends_on = [
    var.module_depends_on
  ]
}

resource "null_resource" "jobs_ns" {
  provisioner "local-exec" {
    command = "kubectl create ns jobs"
  }

# Used to force dependency on GKE cluster.
  depends_on = [
    var.module_depends_on
  ]
}

resource "null_resource" "gitlab_ns" {
  provisioner "local-exec" {
    command = "kubectl create ns gitlab"
  }

# Used to force dependency on GKE cluster.
  depends_on = [
    var.module_depends_on
  ]
}