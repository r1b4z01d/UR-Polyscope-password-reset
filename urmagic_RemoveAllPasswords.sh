#!/bin/sh


LOGGER=/usr/bin/logger

if [ "$1" = "" ] ; then
    $LOGGER -p user.info "$0: no mountpoint supplied, exiting."
    exit 1 ; fi

MOUNTPOINT="$1"


# Warn user not to remove USB key
 echo "! USB !" | DISPLAY=:0 aosd_cat -R red -x 230 -y -210 -n "Arial Black 80"
 sleep 5
#remove password file from directory
 rm /root/.urpass.file
#make sure file is deleted
 sync
 sync
#remove safety password file from directory
 rm /root/.ursafetypass.file
 sync
 sync
#make sure file is deleted
 echo 'root:easybot' | chpasswd
 sync
 sync
 echo "REBOOTING.. Unplug USB" | DISPLAY=:0 aosd_cat -x 200 -y -210 -n "Arial Black 60"
 sleep 5
 reboot

