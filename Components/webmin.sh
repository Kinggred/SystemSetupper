#!/bin/bash
sudo echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
sudo apt install gnupg -y
curl -s http://www.webmin.com/jcameron-key.asc | sudo gpg --dearmor --yes -o /usr/share/keyrings/webmin.gpg
echo "deb [signed-by=/usr/share/keyrings/webmin.gpg] http://download.webmin.com/download/repository sarge contrib" | sudo tee /etc/apt/sources.list.d/webmin.list

sudo apt-get update -y

sudo apt-get install webmin -y

sudo service apache2 restart