#!/bin/bash

# Program: DEVTOP
# Version: 2.0
# Authors: Thijs Haker

# Show DEVTOP artwork
clear ; cat rootfs/etc/issue

# Check if root and/or sudo
if [[ $(id -u) -ne 0 ]] ; then
	printf "Error: Please run this script as root!\n"
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
	printf "Error: The specified home directory doesn't exist!\n"
	exit 1
fi

# Update database
printf "Info: Updating database...\n" ; pacman -Sy > /dev/null

# Execute scripts
bash scripts/system.sh
bash scripts/user.sh

# Goodbye and exit
printf "Info: Done! Please reboot the machine!\n"
exit 0
