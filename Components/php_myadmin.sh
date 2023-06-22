#!/bin/bash

echo "phpmydamin phpmyadmin/dbconfig-install boolean true" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password ${PHP_PASSWD}" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password ${MYSQL_PASSWD}" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password ${MYSQL_PASSWD}" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | sudo debconf-set-selections

sudo apt install -y phpmyadmin php8.1-mbstring php-php-gettext

sudo phpenmod -v 8.1 mbstring

text="Include /etc/phpmyadmin/apache.conf"

if ! grep -q ${text} /etc/apache2/apache2.conf; then
	echo $text | sudo tee -a /etc/apache2/apache2.conf
fi

sudo systemctl restart apache2

curl -fsS "http://localhost/phpmyadmin" > /dev/null
if [ $? -eq 0 ]; then
	echo "phpMyAdmin works"
fi
