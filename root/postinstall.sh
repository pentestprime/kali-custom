!/bin/bash
# init
function pause(){
echo ' '
echo 'Press any key to continue...';   read -p "$*"
}
clear
echo 'System Update'
echo '______________________________________ '
apt update
echo 'Update RSA SSH Keys'
ssh-keygen -t rsa
systemctl restart ssh
systemctl start cups
systemctl start apache2
systemctl start mysql
systemctl start postgresql
systemctl start tor
systemctl enable ssh
systemctl enable cups
systemctl enable apache2
systemctl enable mysql
systemctl enable postgresql
systemctl enable tor
echo 'Init Metacploit Database'
msfdb init
echo 'Init File Locater Database'
updatedb
echo 'Get Stuff from github'
echo 'Get Veil Framework'
git clone https://github.com/Veil-Framework/Veil.git
echo 'Get Discover Scripts for Gethub'
git clone https://github.com/leebaird/discover.git
echo 'Get Penetration Testing Framework'
git clone https://github.com/trustedsec/ptf
pause
apt upgrade -y
echo ''
echo 'Finished.............'

