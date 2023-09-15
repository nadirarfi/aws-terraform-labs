resource "aws_instance" "my_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.allow_ssh_http.id]
  user_data = "${file("user-data.sh")}"
  subnet_id = aws_subnet.my_subnet.id

  tags = {
    Name = "Web Server"
  }
}