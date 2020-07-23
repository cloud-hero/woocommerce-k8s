resource "helm_release" "nfs-server" {
  name  = "nfs-server"
  chart = "stable/nfs-server-provisioner"
  values = [file("helm/values-nfs-server.yaml")]

  depends_on = [
    null_resource.helm_repo,
  ]
}

resource "helm_release" "mysql" {
  name  = "mysql"
  chart = "stable/mysql"
  values = [file("helm/values-mysql.yaml")]

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
  ]
}

resource "helm_release" "prometheus" {
  name  = "prometheus"
  chart = "stable/prometheus"
  values = [file("helm/values-prometheus.yaml")]

  depends_on = [
    null_resource.helm_repo,
  ]
}

resource "helm_release" "grafana" {
  name  = "grafana"
  chart = "stable/grafana"
  values = [file("helm/values-grafana.yaml")]

  set {
      name  = "adminPassword"
      value = random_password.grafana_pass.result
  }

  depends_on = [
    null_resource.helm_repo,
  ]
}

resource "helm_release" "elasticsrarch" {
  name  = "elasticsearch"
  chart = "elastic/elasticsearch"
  values = [file("helm/values-elasticsearch.yaml")]

  depends_on = [
    null_resource.helm_repo,
  ]
}

resource "helm_release" "kibana" {
  name  = "kibana"
  chart = "elastic/kibana"
  values = [file("helm/values-kibana.yaml")]

  depends_on = [
    null_resource.helm_repo,
  ]
}

resource "helm_release" "filebeat" {
  name  = "filebeat"
  chart = "elastic/filebeat"
  values = [file("helm/values-filebeat.yaml")]

  depends_on = [
    null_resource.helm_repo,
  ]
}

resource "helm_release" "woocommerce" {
  name  = "woocommerce"
  chart = "bitnami/wordpress"
  values = [file("helm/values-wordpress.yaml")]

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
  ]
}