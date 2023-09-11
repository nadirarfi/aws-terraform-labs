
data "aws_availability_zones" "available" {
    state = "available"
}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

resource "aws_subnet" "my_subnets" {
  count = length(data.aws_availability_zones.available.names) # Count the number of AZs
  vpc_id = aws_vpc.main.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Name = "Nadir VPC Subnet n°${count.index}"
  }
}
