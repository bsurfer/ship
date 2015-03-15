ship
========


Purpose
------------

- Have various services in same host
- Shared resources
- Isolated services
- Isolated IP Address

Introduction
------------

This simple script is very helpful if you want, quickly, test some software in a chroot with totally isolation (mounts, network, user,etc), using some new technologies like namespaces. This is nothing more than one, normal, chroot but isolated.

I called "ship" to each of  isolated chroot. And, is possible you have one or more ship/s running.

With this you don't need to install virtualbox, vmware, etc... ok, but you need install some packages :)

By default, Debian distributions don't have the option -p (unshare pid) and -f (fork before launching) at unshare, so, we need compile the util-linux package.

You change the ip's at /etc/network/interfaces and /etc/hosts in the beginning, before your start.
By default i use 192.168.79.139. The next version must have this feature solved.

Now, the openvswitch support was release. Some configurations are needed on host (see below) and use the chrootmns script.

In the next version i will test/develop, first, in Ubuntu and after CentOs


Features
------------

- Run like a normal SO
- All services was isolated
- /proc and /sys are host independent
- Is possible have one or more network interfaces
- CLI to start/stop/connect in to chip
- run different versions of debian OS
- Portable

Note
------------
Developed and tested in debian and derivatives, only!


Requirements
------------
- Kernel >= 3.14

Add this repository to install kernel > 3.14:

```bash
> echo 'deb http://ftp.debian.org/debian/ wheezy-backports main non-free contrib' >> /etc/apt/sources.list

> apt-get update

> apt-get -t wheezy-backports install linux-image-amd64 linux-headers-amd64 
```

- Debian/Ubuntu packages:
> apt-get install build-essential python-dev python-pkg-resources python-setuptools  python-ipaddr curl unzip vim openvswitch-switch
> easy_install pip
> pip install ipcalc netaddr sh config


Installation
------------
From Script:
> sh install_me or sh install_me_ovs


Usage
-----
```bash
Usage: shipmn [options]

Options:
  create			create new ship using debootstrap
  status			ship's status
  start all			start all ship's
  start ship_name		start ship
  stop all			stop all ship's
  stop ship_name		stop  ship
  con ship_name			enter in ship
```

Examples:

```bash
-> shipmn create webserver
-> shipmn status
Status all
webserver Not Running
-> shipmn start webserver
-> shipmn con webserver
```

You can find some use case in HowTo folder!!
