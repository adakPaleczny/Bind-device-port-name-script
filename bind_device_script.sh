#! /bin/bash
## Bash scrpit for binding a port
## This script must be run as a root (with sudo)
## example: sudo ./bind_device_script.sh ttyACM0 GPS
## First argument is name of the port in /dev
## Second argument is name of the port you would like to have

port=$1
port_name=$2

FILE=/dev/$port

##checking if port exist
if [ -a "$FILE" ] 
then
##getting idVendor and idProduct of your device
idVendor=$(udevadm info --name=/dev/$port --attribute-walk | grep -m 1 "idVendor") 
idProduct=$(udevadm info --name=/dev/$port --attribute-walk | grep -m 1 "idProduct")

##creating a file for rules
touch /etc/udev/rules.d/99-usb-serial.rules
##getting rule written in a file
echo SUBSYSTEM==\"tty\", $idVendor, $idProduct, SYMLINK+=\"$port_name\" >> /etc/udev/rules.d/99-usb-serial.rules

##restarting name
udevadm control --reload
udevadm trigger

else
##port doesn't exist
echo "ERROR: File /dev/$port doesn't exist"

fi