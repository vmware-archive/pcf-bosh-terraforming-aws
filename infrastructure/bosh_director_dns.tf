resource "aws_route53_record" "director" {
  zone_id = "${aws_route53_zone.pcf_zone.id}"
  name    = "director.${var.env_name}.${var.dns_suffix}"
  type    = "A"
  ttl     = 300

  records = ["${aws_eip.director_external_ip.public_ip}"]
}

resource "aws_eip" "director_external_ip" {
}