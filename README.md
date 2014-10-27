ship
========

Introduction
------------

This simple script is very helpful if you want, quickly, test some software in a chroot with totally isolation (mounts, network, user,etc), using some new technologies like namespaces. This is nothing more than one, normal, chroot but isolated.

I called "ship" to each of  isolated chroot. And, is possible you have one or more ship/s running.

With this you don't need to install virtualbox, vmware, etc... ok, but you need install some packages :)

By default, Debian distributions don't have the option -p (unshare pid) and -f (fork before launching) at unshare, so, we need compile the util-linux package.

You change the ip's at /etc/network/interfaces and /etc/hosts in the beginning, before your start.
By default i use 192.168.79.139. The next version must have this feature solved.

In the next version i will test/develop, first, in Ubuntu and after CentOs

Note
------------
Developed and tested at debian wheezy, only!


Requirements
------------
- Kernel >= 3.14

Add this repository to install kernel 3.14:

```bash
deb http://http.debian.net/debian wheezy-backports main

> apt-get -t wheezy-backports install linux-image-3.14-0.bpo.1-amd64
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
  create			create new chroot using debootstrap
  status			ship's status
  start all			start all ship's
  start ship_name		start ship
  stop all			stop all ship's
  stop ship_name		stop  ship
  con ship_name			enter in ship
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
