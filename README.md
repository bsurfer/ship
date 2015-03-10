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
Developed and tested at debian wheezy, only!


Requirements
------------
- Kernel >= 3.14

Add this repository to install kernel > 3.14:

```bash
deb http://http.debian.net/debian wheezy-backports main

> apt-get -t wheezy-backports install linux-image-amd64 
```

- Debian/Ubuntu packages:
build-essential python-dev python-pkg-resources python-setuptools python-ipaddr

- Openvswitch packages:
openvswitch-switch

- Openvswitch config:
```bash
ovs-vsctl add-br ovsbr
ovs-vsctl add-port ovsbr eth0

cat /etc/network/interfaces
auto eth0
iface eth0 inet static
address 0.0.0.0
auto ovsbr
iface ovsbr inet static
        pre-up /etc/init.d/openvswitch-switch start
        ovs_type OVSBridge
        ovs_ports eth0 ovsbr
        address 192.168.79.131
        netmask 255.255.255.0
        broadcast 192.168.79.255
        gateway 192.168.79.2
        dns-nameservers 192.168.79.2
        up /sbin/ifconfig $IFACE up
```

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
with openvswitch
> sh install_me_ovs


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
