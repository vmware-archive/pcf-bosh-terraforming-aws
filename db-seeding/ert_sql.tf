variable "rds_endpoint" {}
variable "rds_username" {}
variable "rds_password" {}

provider "mysql" {
  endpoint = "${var.rds_endpoint}"
  username = "${var.rds_username}"
  password = "${var.rds_password}"
}

resource "mysql_database" "uaa" {
  name     = "uaa"
}

resource "mysql_database" "ccdb" {
  name     = "cloud_controller"
}

resource "mysql_database" "diego" {
  name     = "diego"
}

resource "mysql_database" "app_usage_service" {
  name     = "app_usage_service"
}
