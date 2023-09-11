
# Architecture requirement
- VPC with subnet in each AZ
- All the subnets are associated with default route table
- The main route table has route to 0.0.0.0/0 with IGW as a target



# Steps
1. Create a terraform.tf file where the required providers are defined, as well as its configuration (credentials, region, profile etc...)
2. Create a VPC resource with a CIDR block of 10.0.0.0/16
3. Retrieve a list of AZs in the region, and assign a subnet to each AZ
4. Associate an internet gateway to the created VPC
5. Add a rule to the main route table to route 0.0.0.0/0 traffic to IGW