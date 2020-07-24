resource "helm_release" "nfs-server" {
  name   = "nfs-server"
  chart  = "stable/nfs-server-provisioner"
  values = [file("modules/k8s/helm/values-nfs-server.yaml")]

  depends_on = [
    null_resource.helm_repo,
  ]
}

resource "helm_release" "mysql" {
  name      = "mysql"
  namespace = "woocomm"
  chart     = "stable/mysql"
  values    = [file("modules/k8s/helm/values-mysql.yaml")]

  set {
      name  = "mysqlPassword"
      value = random_password.wp_mysql_pass.result
  }

  set {
      name  = "mysqlRootPassword"
      value = random_password.mysql_root_pass.result
  }

  depends_on = [
    null_resource.helm_repo,
    null_resource.woocomm_ns,
  ]
}

resource "helm_release" "prometheus" {
  name      = "prometheus"
  namespace = "monitoring"
  chart     = "stable/prometheus"
  values    = [file("modules/k8s/helm/values-prometheus.yaml")]

  depends_on = [
    null_resource.helm_repo,
    null_resource.monitoring_ns,
  ]
}

resource "helm_release" "grafana" {
  name      = "grafana"
  namespace = "monitoring"
  chart     = "stable/grafana"
  values    = [file("modules/k8s/helm/values-grafana.yaml")]

  set {
      name  = "adminPassword"
      value = random_password.grafana_pass.result
  }

  depends_on = [
    null_resource.helm_repo,
    null_resource.monitoring_ns,
  ]
}

resource "helm_release" "elasticsrarch" {
  name      = "elasticsearch"
  namespace = "logging"
  chart     = "elastic/elasticsearch"
  values    = [file("modules/k8s/helm/values-elasticsearch.yaml")]

  depends_on = [
    null_resource.helm_repo,
    null_resource.logging_ns,
  ]
}

resource "helm_release" "kibana" {
  name      = "kibana"
  namespace = "logging"
  chart     = "elastic/kibana"
  values    = [file("modules/k8s/helm/values-kibana.yaml")]

  depends_on = [
    null_resource.helm_repo,
    null_resource.logging_ns,
  ]
}

resource "helm_release" "filebeat" {
  name      = "filebeat"
  namespace = "logging"
  chart     = "elastic/filebeat"
  values    = [file("modules/k8s/helm/values-filebeat.yaml")]

  depends_on = [
    null_resource.helm_repo,
    null_resource.logging_ns,
  ]
}

resource "helm_release" "woocommerce" {
  name      = "woocommerce"
  namespace = "woocomm"
  chart     = "bitnami/wordpress"
  values    = [file("modules/k8s/helm/values-wordpress.yaml")]

  set {
      name  = "externalDatabase.password"
      value = random_password.wp_mysql_pass.result
  }

  set {
      name  = "wordpressPassword"
      value = random_password.wp_admin_pass.result
  }

  depends_on = [
    null_resource.helm_repo,
    helm_release.nfs-server,
    null_resource.woocomm_ns,
  ]
}