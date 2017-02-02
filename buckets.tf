resource "aws_s3_bucket" "cloud_controller" {
  bucket = "${var.env_name}-cloud-controller"

  tags {
    Name = "Elastic Runtime Cloud Controller"
  }
}