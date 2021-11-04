#!/bin/bash

sudo su
yum -y update
yum install httpd -y
service httpd start
chkconfig httpd on
touch /var/www/html/index.html
chmod 777 /var/www/html/index.html
echo "<html><h1>This is WebServer from ${subnet_type} subnet</h1></html>" > /var/www/html/index.html