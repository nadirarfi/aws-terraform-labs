resource "aws_rds_cluster" "aurora_rds" {
  cluster_identifier      = "myauroracluster"
  engine                  = "aurora-mysql"
  engine_version = "5.7"
  database_name           = "MyDB"
  master_username         = var.username
  availability_zones = var.cluster_availability_zones
  master_password         = var.password
  vpc_security_group_ids = [aws_security_group.rds_server.id]
  storage_encrypted = false
  skip_final_snapshot   = true          
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count = var.n_cluster_instances
  identifier         = "my-aurora-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora_rds.id
  publicly_accessible = true
  instance_class     = var.db_instance_class
  engine             = aws_rds_cluster.aurora_rds.engine
  engine_version =      aws_rds_cluster.aurora_rds.engine_version            
}