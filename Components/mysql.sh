#!/bin/bash

echo "mysql-server mysql-server/root_password password ${MYSQL_PASSWD}"
echo "mysql-server mysql-server/root_password_again password ${MYSQL_PASSWD}"

sudo apt install -y mysql-server

sudo service mysql start

sudo service mysql status

sudo mysql -uroot -p -e "CREATE USER '${USERNAME}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWD}';"
sudo mysql -uroot -p -e "GRANT ALL PRIVILEGES ON *.* TO '${USERNAME}'@'localhost' WITH GRANT OPTION;"
sudo mysql -uroot -p -e "FLUSH PRIVILEGES;"
