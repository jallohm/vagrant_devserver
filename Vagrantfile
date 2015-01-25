# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  #config.vm.box = "ubuntu/trusty64"
  #Customize name of box to be "organization-explicit"
  #Note: This is the ubuntu/trusty64 Vagrant box
  config.vm.box = "imentor_dev"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
  config.vm.network "forwarded_port", guest: 8000, host: 8000

  #create a virtual private network and ip for this dev server
  config.vm.network "private_network"; ip: "12.34.56.78"

  # disable default /vagrant share
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # assume platform and vagrant_devserver are checked out and peers
  #symlink server's '/var/www/' directory with our '/imentor' directory
  #The whole project should be accessible from here: '/imentor'
  config.vm.synced_folder "../", "/imentor"

  #Make the project folder accessible from the guest machine (Vagrant devserver)
  # when you 'vagrant ssh' in and go to '/home/vagrant/imentor'
  config.vm.share_folder "project", "/home/vagrant/imentor", "." 

  #config.vm.provision "shell", path: "vagrant/provision.sh"
  #Edited the original provision script to include other package downloads
  config.vm.provision "shell", path: "vagrant/setup_script.sh"
end