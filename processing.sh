#!/bin/bash
# init
function pause(){
echo ''
echo 'Press any key to continue with next step ...';   read -p "$*"
clear
}
clear
#
# Processing Build
#
echo 'Setp 1: Installing Kali Bootstrap'
cd /root
apt install curl git live-build cdebootstrap
echo 'Setp 2: Creating Kali Live build Directory Structure'
git clone git://git.kali.org/live-build-config.git
echo 'Step 3: Downloading Preceed file'
cd /root/live-build-config
wget https://www.kali.org/dojo/preseed.cfg  -O ./kali-config/common/includes.installer/preseed.cfg
echo 'Step 4: Creating Directory Structure'
cd /root/Downloads/kali-custom
cp -r root /root/live-build-config/kali-config/common/includes.chroot/
cp -r etc /root/live-build-config/kali-config/common/includes.chroot/
cp 02-unattended-boot.binary /root/live-build-config/kali-config/common/hooks/
cp preseed.cfg /root/live-build-config/kali-config/common/includes.installer/
cp kali.list.chroot /root/live-build-config/kali-config/variant-default/package-lists/
echo 'Creating and moving deb files to the isntall location'
mkdir /root/live-build-config/kali-config/variant-default/packages.chroot
cp *.deb /root/live-build-config/kali-config/variant-default/packages.chroot
echo 'Step 5: Build the ISO....'
echo 'This will take some time'
cd /root/live-build-config
./build.sh --distribution kali-rolling --verbose
