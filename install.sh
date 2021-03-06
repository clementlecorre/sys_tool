#!/bin/bash -   
#title          :install.sh
#description    :Script for install admin tools
#author         :cl3m3nt
#date           :2016-01-18
#version        :1.0    
#usage          :./installl.sh
#notes          :       
#bash_version   :4.2.37(1)-release
#OS_version     :Debian GNU/Linux 7.9 (wheezy)
#============================================================================

echo -ne "\033[0;32mPlease input installation directory [/etc/dynmotd]> \033[1;37m"
read dirinput
inpsize=${#dirinput}

if [ "$inpsize" -eq 0 ]
then
installdir="/etc/dynmotd"
fi
if [ "$inpsize" -gt 0 ]
then
installdir=$dirinput
fi
cp bashrc/bashrc /etc/bash.bashrc

mkdir $installdir
cp dymotd/dynmotd.sh $installdir/dynmotd.sh
chmod 755 $installdir/dynmotd.sh
cp dymotd/update-checker.sh $installdir/update-checker.sh
chmod 755 $installdir/update-checker.sh
touch $installdir/updates-available
chmod 755 $installdir/updates-available
echo "--" >> $installdir/updates-available
$installdir/update-checker.sh
echo " " > /etc/motd
echo "$installdir/dynmotd.sh" >> /etc/profile
apt-get install toilet cowsay screen fortune make
cd /usr/games/ && wget https://www.fortunes-fr.org/fortunes-fr/fortunes-fr-0.02.tar.gz && tar xzvf fortunes-fr-0.02.tar.gz && rm fortunes-fr-0.02.tar.gz
mv fortunes-fr-0.02 fortunes-fr
cd fortunes-fr && ./configure && make && make install
cd
echo -ne "\033[0;32mConfig by cl3m3nt\033[1;37m"
echo " "

