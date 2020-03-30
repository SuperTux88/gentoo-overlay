# SuperTux88 Gentoo overlay

Current build status: [![Build Status](https://travis-ci.org/SuperTux88/gentoo-overlay.svg?branch=master)](https://travis-ci.org/SuperTux88/gentoo-overlay)

**use at your own risk**

## Usage

Add this to `/etc/portage/repos.conf/supertux88.conf`:

```
[supertux88]
location = /var/db/repos/supertux88/
sync-type = git
sync-uri = https://github.com/SuperTux88/gentoo-overlay.git
auto-sync = yes
```

**or**

Install using [Layman](https://wiki.gentoo.org/wiki/Layman):

```
layman -o https://raw.github.com/SuperTux88/gentoo-overlay/master/overlay.xml -f -a supertux88
```

## Packages

The following packages are available in this overlay:

* app-misc/google-cloud-sdk
  * Google Cloud SDK
  * https://cloud.google.com/sdk
* dev-libs/date
  * A date and time library based on the C++11/14/17 \<chrono\> header
  * required for gui-apps/waybar
  * https://github.com/HowardHinnant/date
* gnome-base/gnome-control-center
  * Same as upstream, with additional `modemmanager` USE flag
* gnome-extra/gnome-tweaks
  * Same as upstream, with additional `gnome-shell` USE flag
* gui-apps/waybar
  * Highly customizable Wayland bar for Sway and Wlroots based compositors
  * https://github.com/Alexays/Waybar
* gui-libs/gtk-layer-shell
  * A library to create panels and other desktop components for Wayland using the Layer Shell protocol
  * required for gui-apps/waybar[gtk-layer-shell]
  * https://github.com/wmww/gtk-layer-shell
* kde-plasma/breeze
  * Same as upstream, with additional `kde-cli-tools` USE flag
* media-gfx/flameshot
  * Powerful yet simple to use screenshot software
  * https://github.com/lupoDharkael/flameshot
* media-libs/wlrobs
  * An obs-studio plugin that allows you to screen capture on wlroots based wayland compositors
  * https://hg.sr.ht/~scoopta/wlrobs
* sys-apps/skiller-ctl
  * Control the additional features (e.g., LEDs) of Sharkoon Skiller (Pro/Pro+) keyboards
  * https://github.com/anyc/skiller-ctl
* sys-apps/zenmonitor
  * Monitoring software for AMD Zen-based CPUs
  * https://github.com/ocerman/zenmonitor
* sys-kernel/it87
  * IT87 sensors module
  * https://github.com/a1wong/it87
* sys-kernel/tuxedo-wmi
  * TUXEDO WMI Treiber - Flugmodus-Taste und Tastaturbeleuchtung
  * https://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26
* sys-kernel/zenpower
  * Linux kernel driver for reading sensors of AMD Zen family CPUs
  * https://github.com/ocerman/zenpower
* x11-apps/xfhd
  * xfhd is a utility for resizing an X window to Full HD
  * https://github.com/r41d/xfhd
