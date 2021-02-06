deploy-system
=============
deploys my current system config. 

Running the script
------------------   
   usage: sh deploy.sh [i]
					  [c]
					  [f]
		options :
		i		only installs what is found in components.txt
		c		only configures the way it is written in configure.sh
		f		both installs and configures.
   
Supported package managers
--------------------------
   - apt
   - zypper
   - pacman
   - dnf
   - yum
   - portage (emerge)
   
  * Support for other package managers can be easily added by creating a new case for them.

Components that the script will install
---------------------------------------
   - All components that this script will install can be found in the components.txt file.
   
   * Other software can be installed by this script to the list.Simply add the name of the package in the components.txt file.
   
Important 
---------
   - This configuration doesn't include i3wm-mac-syskeys.I chose not to include it,as this configuration will be used on other computers too,not just my Mac.
   - Dolphin File Manager doesn't work as expected.That's why Thunar will be installed instead.
   - Every desktop application that sends notifications will freeze when receiving notifications.
   
   