#!/bin/bash
# init
function pause(){
echo ''
echo 'Press any key to continue with next step ...';   read -p "$*"
clear
}
clear
#
#
# Processing Build
#
#
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
cp -r bin /root/live-build-config/kali-config/common/includes.chroot/
cp 02-unattended-boot.binary /root/live-build-config/kali-config/common/hooks/
cp preseed.cfg /root/live-build-config/kali-config/common/includes.installer/
cp kali.list.chroot /root/live-build-config/kali-config/variant-default/package-lists/
echo 'Creating and moving deb files to the isntall location'
# If your deb file has not been converted to run on a
# debian/kali format please stop this process and run the
# following command to convert the file ==  dpkg-name file name
# The file will be convered.  Place the converted file into the
# root of the install folder and run the inst.sh file agian
mkdir /root/live-build-config/kali-config/variant-default/packages.chroot
cp *.deb /root/live-build-config/kali-config/variant-default/packages.chroot
# 'Step 5: Build the ISO....'
# This step will take several hours depending on bandwidth...
# If there is an error, such as a program not found in the repository
# you can check the build log, correct the problem and execute the
# script again.  the second time you run the script you will get
# messages that the action may have already completed, this is to he expected
cd /root/live-build-config
./build.sh --distribution kali-rolling --verbose
