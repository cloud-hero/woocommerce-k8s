provider "google" {
  project = var.project_id
  region  = var.region
}

module "gce" {
    source     = "./modules/gce"
    region     = var.region
    project_id = var.project_id
}

module "k8s" {
    source            = "./modules/k8s"
# Used to force dependency on GKE cluster.
    module_depends_on = module.gce.set_cluster
}