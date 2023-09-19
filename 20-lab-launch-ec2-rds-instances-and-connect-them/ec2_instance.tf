resource "aws_instance" "my_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.rds_sg.name]
  user_data = "${file("user-data.sh")}"

}