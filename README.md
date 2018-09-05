# kali-custom
This will create a custom copy of Kali Linux in ISO format. The image will contain all of Kali Linux as well as other software you wish to include. The ISO that is created will be give you a fully automated install. All you will need to do is choose graphical or text based install, it will do the rest 

1. Download the scripts to root/Downloads directory and execute the inst.sh from there.
2. inst.sh - will let you choose for several desktop environments.
3. software – will let you choose what additional software you wish to enclude in the automated installation process
4. preseed.cfg – will let you change the timezone and other defaults.  I live in the Mountain time zone, you can change it here 
5. If you wish to create other default folders you can put them under the root folder.  If the folders are empty you must put at least one file in them otherwise they will not be created. I put a file called .blankfile.  The period hides the file
6. Upon completion the script will create an ISO in the root/live-build-config/images.
