#!/bin/bash

# Install nodejs in vagrant box
# nodejs 4.x  https://deb.nodesource.com/setup_4.x
# nodejs 0.12.x https://deb.nodesource.com/setup_0.12
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -
sudo apt-get install -y nodejs


# install mongodb from official repository

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update

sudo apt-get install -y mongodb-org


# install nginx

sudo apt-get update
sudo apt-get install -y nginx


# cleanup
sudo apt-get -y autoclean
sudo apt-get -y autoremove

echo "Enter to $(ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//') to view nginx"
