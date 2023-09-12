#!/bin/bash 
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo echo "<html><h1> Welcome to my Web Server!... </h1></html>" >> /var/www/html/index.html
