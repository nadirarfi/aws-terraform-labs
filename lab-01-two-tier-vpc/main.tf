locals {
  tag = "aws-terraform-labs"
}

# VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = local.tag
  }
}


# Internet Gateway
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = local.tag
  }
}

# Route table
resource "aws_route" "route" {
  route_table_id         = aws_vpc.vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway.id
  
}

# Subnets 
data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_subnet" "my_subnets" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = local.tag
  }
}

output "list_azs" {
  description = "Availability zones"
  value       = data.aws_availability_zones.available.names
}