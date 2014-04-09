# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "precise64"
	config.vm.box_url = "http://files.vagrantup.com/precise64.box"
	config.vm.network :private_network, ip: "192.168.33.25"
	config.vm.provision :shell, :path => "_vagrant/install.sh"
	config.vm.provision :shell, :path => "_vagrant/vagrant_bootstrap.sh"
	config.vm.synced_folder ".", "/var/www", id: "vagrant-root",
	owner: "vagrant",
	group: "www-data",
	mount_options: ["dmode=777,fmode=664"]
end
