#!/bin/bash
yum update -y
amazon-linux-extras install nginx1.12 -y
service nginx start
echo "<html><body><h1>Hello World!</h1></body></html>" > /usr/share/nginx/html/index.html
