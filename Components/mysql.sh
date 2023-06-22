#!/bin/bash

echo "mysql-server mysql-server/root_password password ${MYSQL_PASSWD}"
echo "mysql-server mysql-server/root_password_again password ${MYSQL_PASSWD}"

sudo apt install -y mysql-server

sudo service mysql start

sudo service mysql status
