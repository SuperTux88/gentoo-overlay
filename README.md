# SuperTux88 Gentoo overlay

Current build status: [![Build Status](https://travis-ci.org/SuperTux88/gentoo-overlay.svg?branch=master)](https://travis-ci.org/SuperTux88/gentoo-overlay)

**use at your own risk**

## Usage

Install using [Layman](https://wiki.gentoo.org/wiki/Layman):

```
layman -o https://raw.github.com/SuperTux88/gentoo-overlay/master/overlay.xml -f -a supertux88
```

## Packages

The following packages are available in this overlay:

* app-admin/chefdk-omnibus
  * Omnibus installation of ChefDK
  * https://downloads.chef.io/chef-dk/
  * berks and kitchen are not installed to the $PATH, you can use *app-admin/berkshelf* and *app-admin/test-kitchen*
* app-emulation/vagrant-bin
  * A tool for building and distributing virtual machines using VirtualBox
  * https://www.vagrantup.com/
* gnome-base/gnome-control-center
  * Same as upstream, with additional `modemmanager` USE flag
* gnome-extra/gnome-tweak-tool
  * Same as upstream, with additional `gnome-shell` USE flag
* media-sound/mumble
  * bleeding edge git version (9999)
  * with qt5 support
  * with per user volume adjustment patch
  * http://www.mumble.info
  * https://github.com/mumble-voip/mumble
* sys-kernel/tuxedo-wmi
  * TUXEDO WMI Treiber - Flugmodus-Taste und Tastaturbeleuchtung
  * https://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26

