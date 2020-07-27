variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "gce_ssh_pub_key_file" {
    type = string
}

variable "gce_ssh_user" {
    type = string
}