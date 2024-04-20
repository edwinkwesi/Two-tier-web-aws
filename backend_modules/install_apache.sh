#! /bin/bash
yum update -y
yun install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "This instance is part of a 2-Tier Architecture" > /var/www/html/index.html