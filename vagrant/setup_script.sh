#!/bin/sh

# super naive script for bootstrapping a ubuntu instance with:
# * the api app and its python requirements
# * postgres

echo "Let's SSH into our vagrant dev server"
sudo su 
echo "Let's update the Linux CLI utility"
sudo apt-get update
sudo apt-get -y install python-pip python-dev postgresql postgresql-server-dev-9.3
echo -e '\n\n=============================\n'
echo "Next: Let's install the MongoDB packages"

echo "Step #1: Import the public key used by the package management system."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo "Step #2: Create a list file for MongoDB"
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
echo "Step #3: Reload local package database"

echo "Step #4: Install the MongoDB packages"
sudo apt-get install -y mongodb-org

echo "Step #5: Finally, start the MongoDB server instance"
sudo service mongod start

echo "Step #6: VERIFY THAT THE MONGODB PROCESSING IS RUNNING"
echo "Check the contents of the log file at /var/log/mongodb/mongod.log for a line reading"
echo "[initandlisten] waiting for connections on port 27017"

echo -e '\n\n=============================\n'
echo "Installing git on the vagrant server"
sudo apt-get install -y git 
echo "Installing some Python packages of the web stack"
pip install django flask bs4 python-dateutil

sudo mkdir /var/log/uwsgi/
sudo chown vagrant:vagrant /var/log/uwsgi
sudo -upostgres sh -c "psql -f /vagrant/init.sql"
echo -e '\n\n=============================\n'

echo 'TO RUN THE DEV SERVER:'
echo "Enter: 'vagrant ssh'"

cd /imentor && ln -sf ./platform ./imi 
cd /imentor && pip install -r requirements.pip

echo "Please, refer to the SETUP_INSTRUCTIONS.txt file for how to"
echo "clone the repositories, set them up and start the servers."
echo "Thank you."

