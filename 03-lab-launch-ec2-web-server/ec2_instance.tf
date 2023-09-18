resource "aws_instance" "web-server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.my_key.key_name
  security_groups = ["${aws_security_group.allow_ssh_http.name}"]
  user_data = "${file("user-data.sh")}"

  tags = {
    Name = "web_instance"
  }
}