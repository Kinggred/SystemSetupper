#!/bin/bash

echo "Welcome to an amazing feat of engineering: System Setuper"
echo "This amazing piece of software can guarantee you only one thing"
echo "You won't be askin for more anytime soon"

echo "You didn't run this thing with sudo did ya?"
echo "Well, lemme check:"

echo "Update"
sudo apt update -y
echo "Upgrade"
sudo apt upgrade -y
echo "Autoremove"
sudo apt autoremove -y

echo "Installing yq"
sudo snap install yq --classic

echo "You poor soul, you did!"
echo "Well lets check the dependencies before doing anything funny."

yq -V

deps=$yq '.dependencies' deps.yml

echo "Time for some magic looooops"

for dep in $deps; do
	echo "About to install ${dep}"
	sudo apt install -y $dep
done
