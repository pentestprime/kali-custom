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
systemctl enable ssh --mew
systemctl enable cups --new
systemctl enable apache2 --new
systemctl enable mysql --new
systemctl enable postgresql --new
systemctl enable tor --new
systemctl enable cockpit.socket --new
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

