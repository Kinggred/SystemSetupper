#!/bin/bash

echo "Loading environ variables"
source 


echo "mysql-server mysql-server/root_password password ${MYSQL_PASSWD}"
echo "mysql-server mysql-server/root_password_again password ${MYSQL_PASSWD}"

sudo apt install -y mysql-server

sudo service mysql start

sudo service mysql status

sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '${MYSQL_PASSWD}'"
