#!/usr/bin/env bash

echo "Welcome to the Brain Box Matrix..."
echo "0"
echo "01"
echo "010"
echo "0101"
echo "01010"
echo "11100000"
echo "...Plugged in. Let's go!"

echo "--- Updating linux package list ---"
sudo apt-get update

echo "--- Installing MySQL ---"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

echo "--- Installing base linux packages ---"
sudo apt-get install -y vim curl python-software-properties

echo "--- Installing php (current stable release) ---"
sudo add-apt-repository -y ppa:ondrej/php5

echo "--- Updating linux package list ---"
sudo apt-get update

echo "--- Installing PHP packages: libapache2-mod-php5, php5-curl, php5-gd, php5-mcrypt, mysql-server-5.5 php5-mysql git-core ---"
sudo apt-get install -y php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt mysql-server-5.5 php5-mysql git-core

echo "--- Installing and configuring Xdebug ---"
sudo apt-get install -y php5-xdebug

cat << EOF | sudo tee -a /etc/php5/mods-available/xdebug.ini
xdebug.scream=1
xdebug.cli_color=1
xdebug.show_local_vars=1
EOF

echo "--- Enabling mod-rewrite ---"
sudo a2enmod rewrite

echo "--- Setting document root: /var/www/ and syncing to /vagrant/public/ ---"
sudo rm -rf /var/www
sudo ln -fs /vagrant/public /var/www


echo "--- You want errors? Oh I'll give you errors! MUAHAHAHA.... ---"
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini
echo "--- .... Just kidding, error_reporting and display_errors are now on. ---"

sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

echo "--- Restarting Apache ---"
sudo service apache2 restart

echo "--- Installing Composer ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "--- Awesome, you're all set! ---"
echo "--- Oh almost forgot. Hello World. ---"
