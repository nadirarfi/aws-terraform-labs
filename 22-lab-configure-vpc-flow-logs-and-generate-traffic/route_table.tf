resource "aws_route" "default_gateway" {
    route_table_id         = "${aws_vpc.my_vpc.main_route_table_id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = "${aws_internet_gateway.igw.id}"
}

