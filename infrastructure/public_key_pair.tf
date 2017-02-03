resource "aws_key_pair" "default_key_pair" {
  key_name = "${var.env_name}-pcf-key"
  public_key = "${var.public_key}"
}