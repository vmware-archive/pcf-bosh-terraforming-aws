variable "env_name" {}

variable "dns_suffix" {}

variable "access_key" {}

variable "secret_key" {}

variable "public_key" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "availability_zones" {
  type = "list"
}

variable "rds_db_username" {
  type    = "string"
  default = "admin"
}

variable "rds_instance_class" {
  type    = "string"
  default = "db.m3.large"
}

variable "rds_instance_count" {
  type    = "string"
  default = 0
}

variable "parent_hosted_zone_id" {
  type = "string"
  default = ""
}
