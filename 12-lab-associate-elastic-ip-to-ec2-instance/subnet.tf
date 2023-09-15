resource "aws_subnet" "my_subnet" {
  vpc_id = aws_vpc.main.id
  availability_zone = var.availability_zone
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Nadir VPC Subnet"
  }
}

