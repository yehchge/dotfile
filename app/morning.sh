sudo apt update
sudo apt dist-upgrade -y
sudo apt autoremove -y
~/app/switch-php.sh 8.3
sudo service apache2 restart
#~/app/set_samba.sh
