resource "aws_internet_gateway" "MyIGW" {
    vpc_id = aws_vpc.main.id
}