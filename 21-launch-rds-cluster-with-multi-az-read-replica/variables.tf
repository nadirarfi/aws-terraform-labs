variable "availability_zone" {
  description = "Availability Zone"
}

variable "username" {
  description = "DB Username"
}

variable "password" {
  description = "DB Password"
}

variable "ami_id" {
  description = "AMI id"
}

variable "instance_type" {
  description = "Instance type"
}


variable "db_instance_class"{
  description = "DB Instance Class"
}

variable "n_cluster_instances" {
  description = "Number of cluster instances"
}

variable "cluster_availability_zones" {
  description = "Cluster Availability Zones"
}