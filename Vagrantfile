# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  
  #Specify the URL our Linux server machine should be downloaded from, if not 
  #already downloaded
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
  
  #Change the port to one that wouldn't collide with a port in use by the host
  config.vm.network "forwarded_port", guest: 8000, host: 8200

  #create a virtual private network and ip for this dev server ADD AFTERWARDS
  #config.vm.network "private_network", ip: "12.34.56.78"

  #Configure a hostname for our Vagrant dev server instead of the default nil setting
  config.vm.hostname = "imentordev.com"

  # disable default /vagrant share
  config.vm.synced_folder ".", "/vagrant", disabled: true


  #Assuming that the this Vagrantfile is in our local platform/imentor directory
  #Symlink server's '/home/vagrant/imentor' directory with our local 'platform/imentor' directory
  #The whole project should be accessible from here: '/home/vagrant/imentor' on the Vagrant server
  config.vm.synced_folder ".", "/home/vagrant/imentor"

  # Fix symlinking error on Windows (and possibly other) PCs
  #config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
 # Providers
  config.vm.provider :virtualbox do |p|
    p.customize ['modifyvm', :id, '--memory', '512', '--ioapic', 'on']
  end

  #config.vm.provision "shell", path: "vagrant/provision.sh"
  #Edited the original provision script to include other package downloads and such.
  config.vm.provision "shell", path: "vagrant/setup_script.sh"
end