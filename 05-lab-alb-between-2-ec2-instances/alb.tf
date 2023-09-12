resource "aws_lb" "alb" {
  name               = "my-nadir-app-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = data.aws_subnets.default.ids
  ip_address_type = "ipv4"
  enable_deletion_protection = false


  tags = {
    Environment = "Nadir Test"
  }
}


output "elb-dns-name" {
  value = aws_lb.alb.dns_name
}	