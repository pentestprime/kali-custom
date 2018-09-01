#!/bin/bash
#===========================
# Start init
#===========================
function pause(){
    echo 'Press any key to continue...';   read -p "$*"
}
#  End INIT

#=================================================
#===========  Start Main script ==================
#=========== Version 2.0.0  8-30-2018 ============
#=================================================
clear
#========================================
#========== Get Desktop Environment======
#========================================
# menu items
echo ''
    echo "          Select Desktop Environment"
    echo " ____________________________________________________________________"
    echo "1) Install Gnome Desktop"
    echo "2) Install Mate Desktop"
    echo "3) Install Cinnamon Desktop "
    echo " "
    echo "____________________________________________________________________"
    echo " "
echo '         Eneter item to complete';read option
case "$option" in
   1)  
cat << EOF > kali.list.chroot
# You always want those
kali-linux
kali-desktop-live
kali-linux-full
# Graphical desktop
kali-desktop-gnome
EOF
;;
   2) 
cat << EOF > kali.list.chroot
# You always want those
kali-linux
kali-desktop-live
kali-linux-full
# Graphical desktop
mate-desktop-environment
kali-desktop-common
file-roller
gedit
gedit-plugins
gnome-theme-kali
gdm3
mate-tweak
EOF
;;
    3)
cat << EOF > kali.list.chroot
# You always want those
kali-linux
kali-desktop-live
kali-linux-full
# Graphical desktop
cinnamon-desktop-environment
kali-desktop-common
file-roller
gedit
gedit-plugins
gnome-theme-kali
gdm3
EOF
;;
  esac
cat software >> kali.list.chroot
bash processing.sh

