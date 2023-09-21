#!/bin/bash 
sudo su
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<html><h1> Welcome. Happy Learning from $(hostname -f)...</p> </h1></html>" >> /var/www/html/index.html
