# Default VPC and subnets information (ids)

data "aws_vpc" "default"{
    default = true
}


data "aws_subnets" "default" {
    #vpc_id = data.aws_vpc.default.id

  filter {
    name   = "availability-zone"
    values = ["us-east-1a", "us-east-1b"]
  }

  filter {
    name = "default-for-az"
    values = ["true"]
  }

}

output "subnets" {
  value = data.aws_subnets.default.ids
}