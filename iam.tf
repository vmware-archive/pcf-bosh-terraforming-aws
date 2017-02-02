resource "aws_iam_user" "ert_iam_user" {
  name = "${var.env_name}_ert_iam_user"
}

resource "aws_iam_access_key" "ert_iam_user_access_key" {
  user = "${aws_iam_user.ert_iam_user.name}"
}

data "template_file" "ert" {
  template = "${file("${path.root}/templates/iam_ert_buckets_policy.json")}"

  vars {
    cloud_controller_bucket_arn  = "${aws_s3_bucket.cloud_controller.arn}"
  }
}

resource "aws_iam_policy" "ert" {
  name   = "${var.env_name}_ert"
  policy = "${data.template_file.ert.rendered}"
}

resource "aws_iam_policy_attachment" "ert_user_policy" {
  name       = "${var.env_name}_ert_iam_user_policy"
  users      = ["${aws_iam_user.ert_iam_user.name}"]
  policy_arn = "${aws_iam_policy.ert.arn}"
}

resource "aws_iam_user" "bosh_iam_user" {
  name = "${var.env_name}_bosh_iam_user"
}

resource "aws_iam_access_key" "bosh_iam_user_access_key" {
  user = "${aws_iam_user.bosh_iam_user.name}"
}

data "template_file" "bosh" {
  template = "${file("${path.root}/templates/iam_bosh_deploy_policy.json")}"
}

resource "aws_iam_policy" "bosh" {
  name   = "${var.env_name}_bosh"
  policy = "${data.template_file.bosh.rendered}"
}

resource "aws_iam_policy_attachment" "bosh_user_policy" {
  name       = "${var.env_name}_bosh_iam_user_policy"
  users      = ["${aws_iam_user.bosh_iam_user.name}"]
  policy_arn = "${aws_iam_policy.bosh.arn}"
}