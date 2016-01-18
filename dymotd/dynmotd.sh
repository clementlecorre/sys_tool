#/bin/bash -   
#title          :dynmotd.sh
#description    :Motd for Debian
#author         :cl3m3nt
#date           :2016-01-18
#version        :1.0    
#usage          :./dynmotdd.sh
#notes          :       
#bash_version   :4.2.37(1)-release
#OS_version     :Debian GNU/Linux 7.9 (wheezy)
#============================================================================
 
PROCCOUNT=`ps -Afl | wc -l`
PROCCOUNT=`expr $PROCCOUNT - 5`
GROUPZ=`groups`
USER=`whoami`
DMINS=`cat /etc/group | grep --regex "^sudo" | awk -F: '{print $4}' | tr ',' '|'`
DIR=`dirname "$0"`
UPDATESAVAIL=`cat $DIR/updates-available`
 
if [[ $GROUPZ == "$USER sudo" ]]; then
USERGROUP="Administrator"
elif [[ $USER = "root" ]]; then
USERGROUP="Root"
elif [[ $USER = "$USER" ]]; then
USERGROUP="Regular User"
else
USERGROUP="$GROUPZ"
fi
/usr/games/cowsay  $(/usr/games/fortune /usr/game/fortune-fr/data/informatique)
toilet -f mono12 -F metal $(hostname) 
echo -e "\033[1;32m 
\033[0;35m+++++++++++++++++: \033[0;37mSystem Data\033[0;35m :+++++++++++++++++++
\033[0;35m+       \033[0;37mHostname \033[0;35m= \033[1;32m`hostname`
\033[0;35m+   \033[0;37mIPv4 Address \033[0;35m= \033[1;32m`ip addr show eth0 | grep "inet\ " | awk {'print $2'}`
\033[0;35m+         \033[0;37mKernel \033[0;35m= \033[1;32m`uname -r`
\033[0;35m+         \033[0;37mDistro \033[0;35m= \033[1;32m`cat /etc/*release | grep "PRETTY_NAME" | cut -d "=" -f 2- | sed 's/"//g'`
\033[0;35m+         \033[0;37mUptime \033[0;35m= \033[1;32m`uptime | sed 's/.*up ([^,]*), .*/1/'`
\033[0;35m+           \033[0;37mTime \033[0;35m= \033[1;32m`date`
\033[0;35m+            \033[0;37mCPU \033[0;35m= \033[1;32m`cat /proc/cpuinfo | grep "model name" | cut -d ' ' -f3- | awk {'print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10'} | head -1`
\033[0;35m+         \033[0;37mMemory \033[0;35m= \033[1;32m`free -t -m | grep "Mem" | awk {'print $4'}`MB Available, `free -t -m | grep "Mem" | awk {'print $3'}`MB Used, `free -t -m | grep "Mem" | awk {'print $2'}`MB Total
\033[0;35m+        \033[0;37mUpdates \033[0;35m= \033[1;32m$UPDATESAVAIL "Updates Available" 
\033[0;35m++++++++++++++++++: \033[0;37mUser Data\033[0;35m :++++++++++++++++++++
\033[0;35m+      \033[0;37m Username \033[0;35m= \033[1;32m`whoami`
\033[0;35m+      \033[0;37mUsergroup \033[0;35m= \033[1;32m$USERGROUP
\033[0;35m+     \033[0;37mLast Login \033[0;35m= \033[1;32m`last -a $USER | head -2 | awk 'NR==2{print $3,$4,$5,$6}'` from `last -a $USER | head -2 | awk 'NR==2{print $10}'`
\033[0;35m+       \033[0;37mSessions \033[0;35m= \033[1;32m`who | grep $USER | wc -l`
\033[0;35m+      \033[0;37mProcesses \033[0;35m= \033[1;32m$PROCCOUNT of `ulimit -u` max
\033[0;35m+        \033[0;37mScreens \033[0;35m= \033[1;32m`screen -ls`
\033[0;35m+++++++++++++: \033[0;37mHelpful Information\033[0;35m :+++++++++++++++    
\033[0;35m+        \033[1;32m 		motd by cl3m3nt
\033[0;37m
"
