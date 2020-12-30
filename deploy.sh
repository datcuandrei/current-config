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

clear
#cat README
#echo ""
#read -r -p "Proceed? [y/N] " proceed

case $1 in
	i)
		read -r -p "Enter your package manager(apt/dnf/pacman/yum/portage or emerge/zypper) : " pm
		sh install.sh $pm
		;;
	c)
		sh configure.sh
		;;
	f)
		read -r -p "Enter your package manager(apt/dnf/pacman/yum/portage or emerge/zypper) : "$
                sh install.sh $pm
                sh configure.sh
		;;
	*)
		echo "usage: sh deploy.sh [i]"
		echo "			  [c]"
		echo "			  [f]"
		echo "options :"
		echo "i		only installs what is found in components.txt"
		echo "c		only configures the way it is written in configure.sh"
		echo "f		both installs and configures."
		;;
esac

#if [[ "$proceed" =~ ^([yY][eE][sS]|[yY])$ ]]
#then
#
#fi
