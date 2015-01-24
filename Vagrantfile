# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 8000, host: 8000

  # disable default /vagrant share
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # assume platform and api are checked out and peers
  config.vm.synced_folder "../", "/imentor"

  #config.vm.provision "shell", path: "vagrant/provision.sh"
  config.vm.provision "shell", path: "vagrant/setup_script.sh"
end