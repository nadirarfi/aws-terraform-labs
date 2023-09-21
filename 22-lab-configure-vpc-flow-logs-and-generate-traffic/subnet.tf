resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.subnet_az

}   