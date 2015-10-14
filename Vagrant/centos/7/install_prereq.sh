#!/bin/bash

PACKAGE_MANAGER="yum"

# Install nodejs in vagrant box
# nodejs 4.x  https://deb.nodesource.com/setup_4.x
# nodejs 0.12.x https://deb.nodesource.com/setup_0.12
sudo $PACKAGE_MANAGER install curl -y
curl --silent --location https://rpm.nodesource.com/setup | bash -
sudo $PACKAGE_MANAGER install -y nodejs
# [Additional] To compile and install native addons from npm need to install build tool
sudo $PACKAGE_MANAGER groupinstall 'Development Tools'


# install mongodb from official repository
#
# [mongodb-org-2.6]
# name=MongoDB 2.6 Repository
# baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
# gpgcheck=0
# enabled=1
#

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
cat <<EOF
[mongodb-org-3.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/3.0/x86_64/
gpgcheck=0
enabled=1
EOF) | sudo tee /etc/yum.repos.d/mongodb-org-3.0.repo
sudo $PACKAGE_MANAGER install -y mongodb-org


# Install nginx
sudo $PACKAGE_MANAGER update
sudo $PACKAGE_MANAGER install -y nginx
