#!/bin/bash

apt-get update
apt-get upgrade -d -y | grep 'upgraded,' | awk {'print $1'} > /etc/dynmotd/updates-available 
echo "Update Check Complete"
