ship
========

Requirements
------------
- Kernel >= 3.14
Add this repository to install kernel 3.14:
deb http://http.debian.net/debian wheezy-backports main
```bash
apt-get -t wheezy-backports install linux-image-3.14-0.bpo.1-amd64
```

- Debian/Ubuntu packages:
build-essential python-dev python-pkg-resources python-setuptools python-ipaddr

- Python packages:
sh config

- unshare and nsenter from util-linux 2.24
```bash
curl https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.tar.gz | tar -zxf-

cd util-linux-2.24
./configure --without-ncurses
make nsenter
make unshare
cp nsenter $config_folder/bin
cp unshare $config_folder/bin
```

Installation
------------
From Script:
> sh install_me


Usage
-----
```bash
Usage: chrootmn [options]

Options:
  create				create new chroot using debootstrap
  status				ship's status
  start all				start ship
  start ship_name		start just ship_name
  stop all				stop ship
  stop ship_name		stop just ship_name
  con ship_name			enter in ship_name
```

Examples:

```bash
-> chrootmn create webserver
-> chrootmn status
Status all
webserver Not Running
-> chrootmn start webserver
-> chrootmn con webserver
```
