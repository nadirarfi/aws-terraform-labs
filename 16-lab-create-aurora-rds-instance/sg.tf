resource "aws_security_group" "aurora_sg" {
  name        = "aurora_sg"
  description = "Allow port 3306 traffic"
  #vpc_id = aws_vpc.main.id

  ingress {
    description = "Allow port 3306 traffic"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}