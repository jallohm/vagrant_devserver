#!/bin/sh

# super naive script for bootstrapping a ubuntu instance with:
# * the api app and its python requirements
# * postgres

#echo "Let's give ourselves super user status first; just in case."
#sudo su 
echo "Let's update the Linux CLI utility"
sudo apt-get update
sudo apt-get -y install python-pip python-dev postgresql postgresql-server-dev-9.3
# Backup way of installing setup.py and pip
sudo wget https://svn.apache.org/repos/asf/oodt/tools/oodtsite.publisher/trunk/distribute_setup.py
sudo easy_install --upgrade pip
sudo pip install --no-use-wheel --upgrade distribute
sudo python distribute_setup.py

echo -e '\n\n=============================\n'
echo "Next: Let's install the MongoDB packages"

echo "Step #1: Import the public key used by the package management system."
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

echo "Step #2: Create a list file for MongoDB"
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
echo "Step #3: Reload local package database"
sudo apt-get -y update

echo "Step #4: Install the MongoDB packages"
sudo apt-get install -y mongodb-10gen

#echo "Step #5: Finally, start the MongoDB server instance"
#sudo service mongod start

echo "Step #6: VERIFY THAT THE MONGODB PROCESSING IS RUNNING"
echo "Check the contents of the log file at /var/log/mongodb/mongod.log for a line reading"
echo "[initandlisten] waiting for connections on port 27017"

echo -e '\n\n=============================\n'
echo "Installing git on the vagrant server"
sudo apt-get install -y git 
echo "Installing some Python packages of our project's web stack"
#pip install -r requirements.pip

cd /imentor && ln -sf ./platform ./imi 
cd /imentor/ && sudo pip install -r requirements.pip --allow-all-external
export DJANGO_SETTINGS_MODULE='imentor.settings'

echo "CREATE A 'vagrant' DB user"
sudo su postgres -c createuser vagrant
sudo mkdir /var/log/uwsgi/
sudo chown vagrant:vagrant /var/log/uwsgi
sudo -u postgres sh -c "psql -f /vagrant/init.sql"


echo "CREATE A POSTGRES USER AND DATABASE FOR our project"

sudo createuser -s -d imentor
#sudo su postgres -c psql
#ALTER USER imentor WITH PASSWORD '7yh8uj9ik0ol';
#sudo -u postgres createdb -O imentor imentor_production
sudo su createdb -O imentor imentor_production
#sudo su postgres -c psql
#\q

echo -e '\n\n=============================\n'

echo 'TO RUN THE DEV SERVER:'
echo "Enter: 'vagrant ssh'"

echo "Please, refer to the SETUP_INSTRUCTIONS.txt file for how to"
echo "clone the repositories, set them up and start the servers."
echo "Please, email the team with any questions, concerns, comments or suggestions "
echo "This will ensure we can improve this process. Thank you."
