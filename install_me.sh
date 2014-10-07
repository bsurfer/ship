#!/bin/bash
farm_folder='/storage/chroot/farm/'
config_folder='/etc/chroot'

#deb http://http.debian.net/debian wheezy-backports main

apt-get -t wheezy-backports install linux-image-3.14-0.bpo.1-amd64

echo -e 'Remove tmp directory'
rm -rf /tmp/util-linux-2.24
echo -e 'Install packages'
apt-get install build-essential python-dev python-pkg-resources python-setuptools
apt-get install python-ipaddr
easy_install pip
pip install fabric
pip install cuisine
pip install sh
pip install config


echo -e 'Create structure'
mkdir -p  $config_folder
mkdir -p  $farm_folder
echo -e 'Copy files'
cp -r  ship/etc/*  $config_folder
ln -s $config_folder/scripts/chrootmn /usr/bin/
#curl https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.tar.gz | tar -zxf-
echo -e 'Compile nsender and unshare'

tar -zxf ship/util-linux-2.24.tar.gz -C /tmp/
cd /tmp/util-linux-2.24
./configure --without-ncurses
make nsenter
make unshare
cp nsenter $config_folder/bin
cp unshare $config_folder/bin

echo -e 'Finish'
