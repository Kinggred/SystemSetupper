#!/bin/bash
sudo echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
wget -qO - http://www.webmin.com/jcameron-key.asc | sudo apt-key add -

sudo apt-get install webmin -y

sudo service apache2 restart