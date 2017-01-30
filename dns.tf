resource "aws_route53_zone" "pcf_zone" {
  name = "${var.env_name}.${var.dns_suffix}"

  tags {
    Name = "${var.env_name}-hosted-zone"
  }
}

resource "aws_route53_record" "wildcard_sys_dns" {
  zone_id = "${aws_route53_zone.pcf_zone.id}"
  name    = "*.sys.${var.env_name}.${var.dns_suffix}"
  type    = "CNAME"
  ttl     = 300

  records = ["${aws_elb.web_elb.dns_name}"]
}

resource "aws_route53_record" "wildcard_apps_dns" {
  zone_id = "${aws_route53_zone.pcf_zone.id}"
  name    = "*.apps.${var.env_name}.${var.dns_suffix}"
  type    = "CNAME"
  ttl     = 300

  records = ["${aws_elb.web_elb.dns_name}"]
}

resource "aws_route53_record" "ssh" {
  zone_id = "${aws_route53_zone.pcf_zone.id}"
  name    = "ssh.sys.${var.env_name}.${var.dns_suffix}"
  type    = "CNAME"
  ttl     = 300

  records = ["${aws_elb.ssh_elb.dns_name}"]
}

resource "aws_route53_record" "tcp" {
  zone_id = "${aws_route53_zone.pcf_zone.id}"
  name    = "tcp.${var.env_name}.${var.dns_suffix}"
  type    = "CNAME"
  ttl     = 300

  records = ["${aws_elb.tcp_elb.dns_name}"]
}

resource "aws_route53_record" "pcf_zone_ns_record" {
  /* If the parent_hosted_zone_id is non-empty, create this record */
  count = "${min(length(split("", var.parent_hosted_zone_id)),1)}"

  zone_id = "${var.parent_hosted_zone_id}"
  name    = "${aws_route53_zone.pcf_zone.name}"
  type    = "NS"
  ttl     = 300

  records = ["${aws_route53_zone.pcf_zone.name_servers}"]
}
