#set root passwd
echo -e "root\nroot" | sudo passwd

#allow root ssh connect
echo "PermitRootLogin yes" >> /etc/ssh/ssh_config

#restart ssh
sudo /etc/init.d/ssh restart
