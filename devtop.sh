#!/bin/bash

# Program: DEVTOP
# Version: 0.2
# Authors: Thijs Haker

# Hello World!
clear ; cat data/system/issue

# Check if root and/or sudo
if [[ $(id -u) -ne 0 ]] ; then
	printf "Error: Please run me as root/sudo!\n"
	exit 1
fi

# Check if Xorg is intalled (dependeny)
printf "Info: Checking dependencies...\n"
if [[ ! -f /usr/bin/X ]] ; then
	printf "Error: Xorg is not installed!\n"
	exit 1
fi

# Prompt user for ~ directory
printf "Path to home directory: " ; read
if [ -z "$REPLY" ] ; then
	printf "Error: No home directory specified!\n"
	exit 1
fi
export HOME=$REPLY

exit 0
