variable "ami_id" {
  description = "AMI id"
}

variable "instance_type" {
  description = "Instance type"
}



resource "aws_instance" "instances" {
  count = 2 # Create multiple instances
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = "whizlabs-key" # Use already created whizlabs-key
  security_groups = [aws_security_group.allow_http.id]
  user_data = "${file("user-data.sh")}"
  subnet_id =  tolist(data.aws_subnets.default.ids)[count.index]

  tags = {
    Name = "Instance-${count.index}"
  }
}