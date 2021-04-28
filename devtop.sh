#!/bin/bash

# Program: DEVTOP
# Version: 0.5
# Authors: Thijs Haker

# Hello World!
clear ; cat data/system/issue

# Check if root and/or sudo
if [[ $(id -u) -ne 0 ]] ; then
	printf "Error: Please run me as root/sudo!\n"
	exit 1
fi

# Check if Xorg is intalled (dependeny)
printf "Info: Checking dependencies..."
if [[ ! -f /usr/bin/X ]] ; then
	printf "Error: Xorg is not installed!\n"
	exit 1
fi
printf "Done!\n"

# Prompt user for ~ directory
printf "Path to home directory: " ; read
if [ -z "$REPLY" ] ; then
	printf "Error: No home directory specified!\n"
	exit 1
fi
export HOME=$REPLY

# Check if home exists
if [ ! -d $HOME  ] ; then
	printf "Error: Specified directory doesn't exist!\n"
	exit 1
fi

# Update database
printf "Info: Updating database...\n" ; pacman -Sy > /dev/null

# Execute scripts
printf "Info: Running system logic...\n" ; bash logic/system
printf "Info: Running user logic...\n" ; bash logic/user

# Goodbye and exit
printf "Info: Done! Please reboot the machine!\n"
exit 0
