#!/bin/bash

echo "Loading environ variables"
source ../.env


echo "phpmydamin phpmyadmin/dbconfig-install boolean true" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password ${PHP_PASSWD}" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password ${MYSQL_PASSWD}" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password ${MYSQL_PASSWD}" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | sudo debconf-set-selections

sudo apt install -y phpmyadmin php8.1-mbstring php-php-gettext

sudo phpenmod -v 8.1 mbstring

text="Include /etc/phpmyadmin/apache.conf"

sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin
echo "Added some config"

sudo systemctl restart apache2

curl -fsS "http://localhost/phpmyadmin" > /dev/null
if [ $? -eq 0 ]; then
	echo "phpMyAdmin works"
fi
