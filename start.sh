#!/bin/bash

sudo su <<HERE
sudo chmod a+rw /sys/class/backlight/intel_backlight/brightness
sudo chmod a+rw /sys/class/leds/smc::kbd_backlight/brightness
echo 650 > /sys/class/backlight/intel_backlight/brightness
echo 20 > /sys/class/leds/smc::kbd_backlight/brightness
cd Documents/v2.3.1 && sh maclinuxutils.sh
HERE
