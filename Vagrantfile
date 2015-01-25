# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 8000, host: 8000

  #create a virtual private network and ip for this dev server
  config.vm.network "private_network"; ip: "12.34.56.78"

  # disable default /vagrant share
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # assume platform and vagrant_devserver are checked out and peers
  config.vm.synced_folder "./imentor", "/var/www/"; create:true

  #config.vm.provision "shell", path: "vagrant/provision.sh"
  config.vm.provision "shell", path: "vagrant/setup_script.sh"
end