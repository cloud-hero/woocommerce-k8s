resource "google_project_iam_custom_role" "container_push_pull" {
  role_id     = "container.pushPull"
  title       = "Container Push Pull"
  description = "Allows Pushing and Pulling from the Google Cloud Container Registry"
  permissions = ["storage.buckets.create", "storage.buckets.delete", "storage.buckets.get", "storage.buckets.list", "storage.buckets.update", "storage.objects.create", "storage.objects.delete", "storage.objects.get", "storage.objects.list", "storage.objects.update"]
}


data "google_iam_policy" "container_registry" {
  binding {
    role = "projects/${var.project_id}/roles/${google_project_iam_custom_role.container_push_pull.role_id}"

    members = [
      "serviceAccount:${google_service_account.gitlab_service_account.account_id}@${var.project_id}.iam.gserviceaccount.com",
    ]
  }
}

resource "google_service_account" "gitlab_service_account" {
  account_id   = "gitlab-ci"
  display_name = "Gitlab CI"
}

resource "google_service_account_iam_policy" "admin-account-iam" {
  service_account_id = google_service_account.gitlab_service_account.name
  policy_data        = data.google_iam_policy.container_registry.policy_data
}