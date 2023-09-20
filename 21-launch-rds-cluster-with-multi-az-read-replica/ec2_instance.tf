resource "aws_instance" "my_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web_server.name]
  user_data = "${file("user-data.sh")}"
  #key_name        = aws_key_pair.my_key.key_name
}