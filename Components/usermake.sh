#!/bin/bash

echo "Loading environ variables"
source ../.env


sudo mysql -u root <<MYSQL_SCRIPT
CREATE USER '${USERNAME}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWD}';
GRANT ALL PRIVILEGES ON *.* TO '${USERNAME}'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
MYSQL_SCRIPT


sudo useradd -m "${FTP_USERNAME}"
echo "${FTP_USERNAME}:${FTP_PASSWORD}" | sudo chpasswd
