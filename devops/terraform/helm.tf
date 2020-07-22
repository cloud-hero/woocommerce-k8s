resource "helm_release" "nfs-server" {
  name  = "nfs-server"
  chart = "stable/nfs-server-provisioner"
  values = [file("helm/values-nfs-server.yaml")]

  depends_on = [
    google_container_node_pool.primary_nodes,
  ]
}

resource "helm_release" "mysql" {
  name  = "mysql"
  chart = "stable/mysql"
  values = [file("helm/values-mysql.yaml")]

  depends_on = [
    google_container_node_pool.primary_nodes,
  ]
}

resource "helm_release" "prometheus" {
  name  = "prometheus"
  chart = "stable/prometheus"
  values = [file("helm/values-prometheus.yaml")]

  depends_on = [
    google_container_node_pool.primary_nodes,
  ]
}

resource "helm_release" "grafana" {
  name  = "grafana"
  chart = "stable/grafana"
  values = [file("helm/values-grafana.yaml")]

  depends_on = [
    google_container_node_pool.primary_nodes,
  ]
}

resource "helm_release" "elasticsrarch" {
  name  = "elasticsearch"
  chart = "elastic/elasticsearch"
  values = [file("helm/values-elasticsearch.yaml")]

  depends_on = [
    google_container_node_pool.primary_nodes,
  ]
}

resource "helm_release" "kibana" {
  name  = "kibana"
  chart = "elastic/kibana"
  values = [file("helm/values-kibana.yaml")]

  depends_on = [
    google_container_node_pool.primary_nodes,
  ]
}

resource "helm_release" "filebeat" {
  name  = "filebeat"
  chart = "elastic/filebeat"
  values = [file("helm/values-filebeat.yaml")]

  depends_on = [
    google_container_node_pool.primary_nodes,
  ]
}

resource "helm_release" "woocommerce" {
  name  = "woocommerce"
  chart = "bitnami/wordpress"
  values = [file("helm/values-wordpress.yaml")]

  depends_on = [
    google_container_node_pool.primary_nodes,
  ]
}