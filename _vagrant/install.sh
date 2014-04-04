
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

#install php extensions, git, mysql
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

#extra/custom setup
sudo apt-get update

echo "--- Setting up git repo. ---"
#git setup
git config --global user.name "Andrew Wood"
git config --global user.email "andrew@brainboxmedia.ca"

cd /var/www/
mkdir repo && cd repo
mkdir site.git && cd site.git
git init --bare
cd hooks

cat << EOF > post-receive
#!/bin/sh
git --work-tree=/var/www/html --git-dir=/var/www/repo/site.git checkout -f
EOF

chmod +x post-receive

echo "--- Setting up Trash CLI ---"
#install trash CLI, for us mac noobz
sudo apt-get install trash-cli

echo "--- Installing Redis ---"
sudo apt-get install redis-server

echo "--- Installing Beanstalkd ---"
sudo apt-get install beanstalkd

echo "--- Installing Swap File ---"
sudo dd if=/dev/zero of=/swapfile bs=1024 count=256k
sudo mkswap /swapfile
sudo swapon /swapfile
sudo echo "/swapfile       none    swap    sw      0       0 " >> /etc/fstab
echo 10 | sudo tee /proc/sys/vm/swappiness
echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf
