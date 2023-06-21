#!/bin/bash

sudo apt install -y apache2

sudo systemctl start apache2
sudo systemctl enable apache2

sudo ufw allow 'Apache'

ip_address=$(hostname -i | awk '{print $1}')
echo "Your server's IP address is: $ip_address"

http_check_code=$(curl -o /dev/null -s -w "%{http_code}" "http://${ip_address}")

echo "Apache2 server status is: ${http_check_code}"
