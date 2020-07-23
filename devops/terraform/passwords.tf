resource "random_password" "wp_admin_pass" {
  length = 16
  special = true
}

resource "random_password" "wp_mysql_pass" {
  length = 16
  special = true
}

resource "random_password" "mysql_root_pass" {
  length = 16
  special = true
}

resource "random_password" "grafana_pass" {
  length = 16
  special = true
}

output "wp_admin_pass" {
  sensitive = true
  value = random_password.wp_admin_pass.result
}

output "wp_mysql_pass" {
  sensitive = true
  value = random_password.wp_mysql_pass.result
}

output "mysql_root_pass" {
  sensitive = true
  value = random_password.mysql_root_pass.result
}

output "grafana_pass" {
  sensitive = true
  value = random_password.grafana_pass.result
}