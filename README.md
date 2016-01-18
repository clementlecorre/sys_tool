Dynamic Linux MOTD
=========

Dynamically Generated MOTD for Linux Servers 

Compatibility: Debian based Distributions


## Installation

Clone the github repository
```bash
git clone https://github.com/
```
Run the 'installation' script
```bash
cd sys_tool
sudo ./install.sh
```

#### Remove Default MOTD
Edit the /etc/ssh/sshd_config 
```bash
sudo nano /etc/ssh/sshd_config  
```
Replace 
```bash
PrintLastLog yes
#and
PrintMotd yes
```
with
```bash
PrintLastLog no
#and
PrintMotd no
```
Then restart the ssh service
```bash
sudo /etc/init.d/ssh restart
```
Modify /etc/pam.d/login
```bash
sudo nano /etc/pam.d/login
```
Comment out the line below
```bash
#session    optional   pam_motd.so
```
