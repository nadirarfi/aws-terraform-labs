resource "aws_db_instance" "db" {
  db_name                = "my_db_nadtz"
  identifier = "my-rds-database-instance"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
}

