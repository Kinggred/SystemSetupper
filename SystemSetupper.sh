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

deps=$(sudo cat deps.yml | yq '.dependencies')

echo "Time for some magic looooops"

for dep in $deps; do
	echo "About to install ${dep}"
	sudo apt install -y $dep
done

echo "Great fun and all"
echo "Time for some more apps"

echo "What you are about to see is broken perfectly enougth so that i decided to now work on it anymore"

progress_bar() {
	local total=28
	local width=56
	local percent=$((100 * $1 / $total))
	local filled=$((width * $1 / $total))
	local empty=$((width - filled))

	tput sc
	tput cup$(($(tput lines) - 1)) 0

	printf "\rProgress: |%s%s|" "$(printf "%${filled}s" | tr ' ' '#')" "$(printf "%${empty}s" | tr ' ' '-')"$percent
	
	tput rc
}

echo "Initializing fun times"

for i in $(seq 0 28); do
	progress_bar $i
	sleep 1
done

echo "Done"

progs=$(sudo cat deps.yml | yq '.programs')

cd Components

current_progress=0
progress=4
for prog in $progs; do
	progress_bar $current_progress
	echo "Trying to run: ${prog}"
	sudo ./$prog
	current_progress=$(($current_progress+$progress))
done
progress_bar 28
