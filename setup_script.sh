#!/bin/sh

# super naive script for bootstrapping a ubuntu instance with:
# * the api app and its python requirements
# * postgres

echo "Let's SSH into our vagrant dev server"
vagrant ssh 
sudo su 
echo "Let's update the Linux CLI utility"
sudo apt-get update
sudo apt-get -y install python-pip python-dev postgresql postgresql-server-dev-9.3
echo "Next: Let's install the MongoDB packages"
sudo apt-get install -y mongodb-org
echo "Installing git on the vagrant server"
sudo apt-get install -y git 
echo "Installing some Python packages of the web stack"
pip install django bs4 python-dateutil

echo "Now configure git. It is already on your vagrant server. No downloads necessary."
echo "Clone the platform repo"
git clone https://github.com/imentor/platform.git
echo "Clone the api repo"
git clone https://github.com/imentor/api.git
echo "Install the dependencies for the api app"
pip install -r api/requirements.pip 
echo "Install the Python dependencies for the platform app"
pip install -r platform/imentor/requirements.pip
echo "Start the api app's server"
python api/runserver.py

# cd /imentor && ln -sf ./platform ./imi 
# cd /imentor/api && pip install -r requirements.pip
# sudo mkdir /var/log/uwsgi/
#sudo chown vagrant:vagrant /var/log/uwsgi
#sudo -upostgres sh -c "psql -f /imentor/api/vagrant/init.sql"
#echo -e '\n\n=============================\n'
#echo 'TO RUN THE DEV SERVER:'
#echo 'vagrant ssh -c "cd /imentor/api/ && ./runserver.py"'