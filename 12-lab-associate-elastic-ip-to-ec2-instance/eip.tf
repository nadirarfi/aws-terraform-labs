resource "aws_eip" "eip_instance" {
  instance = aws_instance.my_instance.id
  domain   = "vpc"
}

output "public" {
    value= aws_eip.eip_instance.public_ip         
}

output "private" {
    value= aws_eip.eip_instance.private_ip         
}

