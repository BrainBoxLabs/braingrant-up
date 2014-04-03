
#update ubuntu package list
sudo apt-get update

#install mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

#get basic packages installed
sudo apt-get install -y vim curl python-software-properties

#install latest php5 release
sudo add-apt-repository -y ppa:ondrej/php5

#update ubuntu package list
sudo apt-get update

#install php extensions
sudo apt-get install -y php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-readline mysql-server-5.5 php5-mysql git-core php5-xdebug

#enable xdebug
cat << EOF | sudo tee -a /etc/php5/mods-available/xdebug.ini
xdebug.scream=1
xdebug.cli_color=1
xdebug.show_local_vars=1
EOF

#enable the apache rerwrite mod
sudo a2enmod rewrite

#turn on error reporting and display in php
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini
sed -i "s/disable_functions = .*/disable_functions = /" /etc/php5/cli/php.ini

#restart apache
sudo service apache2 restart

#install composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

#set root passwd
echo -e "root\nroot" | sudo passwd

#allow root ssh connect
echo "PermitRootLogin yes" >> /etc/ssh/ssh_config

#restart ssh
sudo /etc/init.d/ssh restart

echo "Welcome to the Brain Matrix."
echo "."
echo ".."
echo "..."
echo "0010100101001010010100101001010010100101001010010100101001010010100101001010010100101001"
echo "0010100101001010010100101001010010100101010110111100101001010010100101001010010100101001"
echo "0010100101001010010100101001010010100101010110111100101001010010100101001010010100101001"
echo "0010100101001010010100101001010010100101011011101100011101110010100101001010010100101001"
echo "0010100101001010010100101001010010100101010110111100101001010010100101001010010100101001"
echo "0010100101011110010100101001010010100101101011011010001000010010100101001010010100101001"
echo "0010100101001010010100101001010010100101010110111100101001010010100101001010010100101001"
echo "0010100101001010010100101001010010010101110111000110101001010010100101001010010100101001"
echo "0010100101001010010100101001010010100101010110111100101001010010100101001010010100101001"
echo "0010100101001010010100101001010010100101010110111100101001010010100101001010010100101001"
echo "0010100101001010010100101001010010100101010100001011100101010010100101001010010100101001"
echo "0010100101001010010100101001010010100101011010100010010001010010100101001010010100101001"
echo "0010100101001010010100101001010010100101010110111100101001010010100101001010010100101001"
echo "0010100101001010010100101001010010100101010110111100101001010010100101001010010100101001"
echo "You are now plugged in. All systems go."
echo "Mark, curl has been installed as well. Please don't touch it."
echo "Oh, and I almost forgot. \"Hello World\"."
