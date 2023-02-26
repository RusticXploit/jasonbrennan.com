---
layout: "../../layouts/BlogPost.astro"
title: "How to recover a windows 10 product key from linux"
description: ""
pubDate: "Feb 25 2023"
---

# How to Recover Windows 10 Product Key on Ubuntu

Remove the hard drive from the old computer and mount it in ubuntu

``` bash
sudo mount /dev/sdX /mnt/{$SomeFolder}`
```

Install hivexget

``` bash
sudo apt install libhivex-bin
```

Recover the key

``` bash
hivexget Windows/System32/config/SOFTWARE '\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform' BackupProductKeyDefault
```
