#!/bin/bash 
sudo su
yum update -y
yum install httpd -y
aws s3 cp s3://${aws_s3_bucket.my_bucket.id}/index.html  /var/www/html/index.html
systemctl status amazon-ssm-agent >> /var/www/html/index.html
systemctl start httpd
systemctl enable httpd