#!/bin/bash

#
# Copyright (c) 2020 Andrei D.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

sudo su <<HERE
clear
cat README
echo "Are you sure you want to proceed?[Y/n]"
read $proceed

DISTRO = $(cat /etc/*-release)

if [[ "$proceed" = "y" || "$proceed" = "Y" ]]; then

	# Installation process

	cat components.txt | while read -r component; do
		case $1 in
			apt)
				sudo apt install $component
				;;
			dnf)
				sudo dnf install $component
				;;
			pacman)
				sudo pacman -S $component
				;;
			yum)
				sudo yum install $component
				;;
			portage | emerge)
				sudo emerge $component
				;;
			zypper)
				sudo zypper in $component
				;;
			*)
				clear
				echo "No package manager was provided as argument or the package manager provided is not supported." &
				exit 0
				;;
		esac
	done

	# Configuration

	echo ""
	echo "Placing the compton config in it's place..."
	cp -avr compton.conf ~/.config/compton.conf
	cd i3
	echo ""
	echo "Configuring i3..."
	cat config ~/.config/i3/config
	cp -avr i3status.conf ~/.config/i3/i3status.conf
else
	clear
	exit 0
fi
HERE
