provider "google" {
  project = var.project_id
  region  = var.region
}

module "gce" {
    source                  = "./modules/gce"
    region                  = var.region
    project_id              = var.project_id
    gce_ssh_pub_key_file    = var.gce_ssh_pub_key_file
    gce_ssh_user            = var.gce_ssh_user
}

module "k8s" {
    source            = "./modules/k8s"
# Used to force dependency on GKE cluster.
    module_depends_on = module.gce.set_cluster
    gitlab_token      = var.gitlab_token
}

output "wp_admin_pass" {
  sensitive = true
  value = module.k8s.wp_admin_pass
}

output "wp_mysql_pass" {
  sensitive = true
  value = module.k8s.wp_mysql_pass
}

output "mysql_root_pass" {
  sensitive = true
  value = module.k8s.mysql_root_pass
}

output "grafana_pass" {
  sensitive = true
  value = module.k8s.grafana_pass
}