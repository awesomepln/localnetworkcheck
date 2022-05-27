#!/bin/zsh 
#created by awesomepln
bold=$(tput bold)
normal=$(tput sgr0)

user=$(whoami)
echo "Hi, ${bold}$user${normal}"
sleep 2s
echo "-----------------------------------------------------------------------
			${bold}created by awesomepln${normal}
-----------------------------------------------------------------------
"
sleep 2s
echo "${bold}This Script developed to list active user in your local network${normal}"
sleep 2s

function scan {
	sleep 1s
	nmap -sn 192.168.1.0/24 -oN users.txt
	sleep 1s
	sed -i '1d' users.txt
	sed -i '$d' users.txt
	sed -i '/Host/d' users.txt
}
scan

function output {
	users=$(cat users.txt) 
	ICON="dialog-information"
	notify-send -t 12000 -i "$ICON" "Scan Results" "$users" 
}
output 

function list {
	date=$(date)
	echo "$date -> NEW REPORT IS HERE" >> report.txt
	var=$(cat users.txt)
	echo $var >> report.txt
	echo "\n" >> report.txt
}
list 

function rapeatable {
	sleep 30m
	scan
	output
	list
}
rapeatable

while :
do
    rapeatable
done
