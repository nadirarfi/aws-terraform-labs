
# VPC (Virtual Private Cloud)
- Custom-defined virtual network within the AWS Cloud.
- Primary components: subnets, IP address range, NAT Instances & Gateways, route tables, Internet and Virtual Private Gateway, Access Control Lists, Security Groups, VPC Endpoints.

# Subnets
- Subnet is a segment of the VPC IP address range
- Can be Public and Private

# Steps:

- Setup terraform and provider (version, default region, access and secret keys) in terraform.tf
- Create a VPC resource
- Assign an Internet Gateway to the VPC
- Assign a 