---
layout: "../../../layouts/HomeLab.astro"
title: "Proxmox"
description: ""
pubDate: "Dec 27 2022"
---
Network: 10.6.6.1/24 - DMZ  
VLAN ID: 600  
IP: 10.6.6.5  
WebUI: https://10.6.6.5:8006

## Installation  
The Proxmox bare-metal ISO installer doesn't work for me. Instead, I have to install it over the top of Debian.

## Debian 11.5 - Bullseye
- Download the [torrent file](/files/debian-11.5.0-amd64-netinst.iso.torrent)
- Open it to download Debian

### Setup the installation USB
Find the USB disk that will be used for the install.
```
sudo fdisk -l
```

### Copy the ISO to the USB disk
Replace `/dev/sdX` with the USB disk found above.
```
sudo dd if=~/Downloads/debian-11.5.0-amd64-netinst.iso of=/dev/sdX status=progress
```

### Install
Insert the USB disk into the machine and boot from it. Follow the prompts to provision and install on the desired disk or disks.

### Network
Make the following change to `/etc/hosts`
``` diff
- 127.0.1.1 debian.local_domain debian
+ 10.6.6.5 inf-thor.jasonbrennan.com inf-thor
```

## Proxmox 7.3

### Add Proxmox repo to APT

```
echo "deb [arch=amd64] [http://download.proxmox.com/debian/pve](http://download.proxmox.com/debian/pve) bullseye pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list;
```

Add Proxmox Repo key
```
sudo wget [https://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg](https://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg) -O /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg;
```
Verify the key
```
sha512sum /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg;
# 7fb03ec8a1675723d2853b84aa4fdb49a46a3bb72b9951361488bfd19b29aab0a789a4f8c7406e71a69aabbc727c936d3549731c4659ffa1a08f44db8fdcebfa  /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg;
```

### Update apt cache and packages
```
sudo apt update && sudo apt full-upgrade;
```

### Install Proxmox kernel
```
sudo apt isntall pve-kernel-5.15 && systemctl reboot;
```

### Install Proxmox packages
```
sudo apt install proxmox-ve postfix open-iscsi;
```

Choose `local only` for mail server

### Remove Debian Kernel
```
sudo apt remove linux-image-amd64 'linux-image-5.10*';
```

### Update Grub
Add /usr/sbin to $PATH:  
Adding the following helps to ensure that the `/usr/sbin` is added to `$PATH` for `su` just like it's added for `su -` There are also other [solutions in this bug report](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=918754)
```
su;
echo 'export PATH=$PATH:/usr/sbin' > /bin/bash && source /root/.bashrc;
update-grub && exit;
```

### Remove the os-prober

```
sudo apt remove os-prober
```

## Network
Add a bridged network that allows virtual machines to access the LAN.

```
sudo vim /etc/network/interfaces
```
Proxmox set to a static IP using DHCP.
```
auto enp5s0
iface enp5s0 inet dhcp

auto vmbr0
iface vmbr0 inet static
	address 10.6.6.5/24
	gateway 10.6.6.1
	bridge-ports enp5s0
	bridge-stp off
	bridge-fd 0
	bridge-vlan-aware yes
	bridge-vids 2-4094
```

Restart the network

```
sudo systemctl restart networking
```