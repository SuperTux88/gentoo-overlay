# SuperTux88 Gentoo overlay

Current build status: [![Build Status](https://travis-ci.org/SuperTux88/gentoo-overlay.svg?branch=master)](https://travis-ci.org/SuperTux88/gentoo-overlay)

**use at your own risk**

## Usage

Add this to `/etc/portage/repos.conf/supertux88.conf`:

```
[supertux88]
location = /usr/local/portage-supertux88/
sync-type = git
sync-uri = git://github.com/SuperTux88/gentoo-overlay.git
auto-sync = yes
```

**or**

Install using [Layman](https://wiki.gentoo.org/wiki/Layman):

```
layman -o https://raw.github.com/SuperTux88/gentoo-overlay/master/overlay.xml -f -a supertux88
```

## Packages

The following packages are available in this overlay:

* gnome-base/gnome-control-center
  * Same as upstream, with additional `modemmanager` USE flag
* gnome-extra/gnome-tweak-tool
  * Same as upstream, with additional `gnome-shell` USE flag
* media-libs/libshout-idjc
  * needed for media-sound/idjc-9999
* media-sound/mumble
  * bleeding edge git version (9999)
  * with qt5 support
  * http://www.mumble.info
  * https://github.com/mumble-voip/mumble
* sys-apps/skiller-ctl
  * Control the additional features (e.g., LEDs) of Sharkoon Skiller (Pro/Pro+) keyboards
  * https://github.com/anyc/skiller-ctl
* sys-kernel/tuxedo-wmi
  * TUXEDO WMI Treiber - Flugmodus-Taste und Tastaturbeleuchtung
  * https://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26
* x11-apps/xfhd
  * xfhd is a utility for resizing an X window to Full HD
  * https://github.com/r41d/xfhd
