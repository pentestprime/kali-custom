!/bin/bash
# init
function pause(){
echo 'Press any key to continue...';   read -p "$*"
}
clear
input="menu.txt"
while IFS= read -r var
do
  echo "$var"
done < "$input"
echo '         Eneter item to complete';read option
case "$option" in
   1) lsblk 
       pause;;
   2)  df -h
       pause;;
   3) apt update 
       pause;;
   4) apt upgrade -y 
       pause;;
   5)  gsettings set org.gnome.desktop.interface scaling-factor 1
       pause;;
   6)  gsettings set org.gnome.desktop.interface scaling-factor 2
       pause;;
   7)  gsettings set org.gnome.desktop.interface scaling-factor 3
      pause;;
   8)  gsettings set org.gnome.desktop.interface scaling-factor 4
      pause;;
   0) exit ;;
  esac
menu


