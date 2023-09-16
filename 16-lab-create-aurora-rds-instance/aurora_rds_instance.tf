resource "aws_rds_cluster" "my_cluster" {
    cluster_identifier      = "myauroracluster"
    engine                  = "aurora-mysql"
    engine_version = "5.7"

    database_name           = "MyDB"
    availability_zones = [
      "us-east-1a", 
      "us-east-1b"
      ]
    master_username         = var.username
    master_password         = var.password
    vpc_security_group_ids = [aws_security_group.aurora_sg.id]
    storage_encrypted = false
    skip_final_snapshot   = true           
  }

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 2
  identifier         = "aurora-cluster-demo-${count.index}"
  cluster_identifier = aws_rds_cluster.my_cluster.id
  instance_class     = "db.t3.small"
  engine             = aws_rds_cluster.my_cluster.engine
  engine_version     = aws_rds_cluster.my_cluster.engine_version
}

