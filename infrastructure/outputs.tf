output "cloud_controller_bucket" {
  value = "${aws_s3_bucket.cloud_controller.bucket}"
}

output "env_dns_zone_name_servers" {
  value = "${aws_route53_zone.pcf_zone.name_servers}"
}

output "bosh_director_domain" {
  value = "${aws_route53_record.director.name}"
}

output "sys_domain" {
  value = "sys.${var.env_name}.${var.dns_suffix}"
}

output "apps_domain" {
  value = "apps.${var.env_name}.${var.dns_suffix}"
}

output "tcp_domain" {
  value = "tcp.${var.env_name}.${var.dns_suffix}"
}

output "default_key_name" {
  value = "${aws_key_pair.default_key_pair.key_name}"
}

output "ert_iam_user_name" {
  value = "${aws_iam_user.ert_iam_user.name}"
}

output "ert_iam_user_access_key" {
  value = "${aws_iam_access_key.ert_iam_user_access_key.id}"
}

output "ert_iam_user_secret_access_key" {
  value = "${aws_iam_access_key.ert_iam_user_access_key.secret}"
}

output "bosh_iam_user_name" {
  value = "${aws_iam_user.bosh_iam_user.name}"
}

output "bosh_iam_user_access_key" {
  value = "${aws_iam_access_key.bosh_iam_user_access_key.id}"
}

output "bosh_iam_user_secret_access_key" {
  value = "${aws_iam_access_key.bosh_iam_user_access_key.secret}"
}

output "rds_address" {
  value = "${aws_db_instance.rds.address}"
}

output "rds_endpoint" {
  value = "${aws_db_instance.rds.endpoint}"
}

output "rds_port" {
  value = "${aws_db_instance.rds.port}"
}

output "rds_username" {
  value = "${aws_db_instance.rds.username}"
}

output "rds_password" {
  value = "${aws_db_instance.rds.password}"
}

output "bosh_security_group_id" {
  value = "${aws_security_group.bosh_security_group.id}"
}

output "vms_security_group_id" {
  value = "${aws_security_group.vms_security_group.id}"
}

output "public_subnet_ids" {
  value = ["${aws_subnet.public_subnets.*.id}"]
}

output "public_subnet_cidrs" {
  value = ["${aws_subnet.public_subnets.*.cidr_block}"]
}

output "public_subnet_availability_zones" {
  value = ["${aws_subnet.public_subnets.*.availability_zone}"]
}

output "bosh_director_external_ip" {
  value = "${aws_eip.director_external_ip.public_ip}"
}

output "ert_subnet_ids" {
  value = ["${aws_subnet.ert_subnets.*.id}"]
}

output "ert_subnet_availability_zones" {
  value = ["${aws_subnet.ert_subnets.*.availability_zone}"]
}

output "ert_subnet_cidrs" {
  value = ["${aws_subnet.ert_subnets.*.cidr_block}"]
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "region" {
  value = "${var.region}"
}

output "azs" {
  value = "${var.availability_zones}"
}

output "router_elb" {
  value = "${aws_elb.web_elb.id}"
}

output "tcp_elb" {
  value = "${aws_elb.tcp_elb.id}"
}

output "ssh_elb" {
  value = "${aws_elb.ssh_elb.id}"
}


output "router_elb_security_group_id" {
  value = "${aws_security_group.elb_security_group.id}"
}

output "tcp_elb_security_group_id" {
  value = "${aws_security_group.tcp_elb_security_group.id}"
}

output "ssh_elb_security_group_id" {
  value = "${aws_security_group.ssh_elb_security_group.id}"
}
