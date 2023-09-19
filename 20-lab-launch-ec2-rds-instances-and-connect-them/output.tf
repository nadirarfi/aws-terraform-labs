output "db_instance_endpoint" {
  value = aws_db_instance.db.endpoint
}

output "web_instance_ip" {
    value = aws_instance.my_instance.public_ip     
}