resource "aws_instance" "my_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.allow_http_https.id}"]
  user_data = "${file("user-data.sh")}"
  iam_instance_profile = aws_iam_instance_profile.my_instance_profile.name
}