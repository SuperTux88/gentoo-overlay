# SuperTux88 Gentoo overlay

Current build status: [![Continuous Integration](https://github.com/SuperTux88/gentoo-overlay/workflows/CI/badge.svg)](https://github.com/SuperTux88/gentoo-overlay/actions?query=workflow%3ACI)

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
* app-shells/gitstatus
  * Git status for Bash and Zsh prompt
  * https://github.com/romkatv/gitstatus
* app-shells/powerlevel10k
  * A theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience
  * https://github.com/romkatv/powerlevel10k
* dev-python/hidapi
  * Python wrapper for the HIDAPI
  * Dependency for liquidctl
  * https://github.com/trezor/cython-hidapi
* gnome-extra/gnome-tweaks
  * Same as upstream, with additional `gnome-shell` USE flag
* kde-plasma/breeze
  * Same as upstream, with additional `kde-cli-tools` USE flag
* media-fonts/meslo-nerd
  * Nerd Font build of Apple's Menlo font
  * https://github.com/ryanoasis/nerd-fonts
* media-fonts/terminus-ttf
  * A TrueType version of Terminus Font
  * https://files.ax86.net/terminus-ttf/
* media-libs/wlrobs
  * An obs-studio plugin that allows you to screen capture on wlroots based wayland compositors
  * https://hg.sr.ht/~scoopta/wlrobs
* sci-electronics/openhantek6022
  * a DSO software for Hantek USB digital signal oscilloscopes 6022BE / BL
  * https://github.com/OpenHantek/OpenHantek6022
* sys-apps/dstat
  * Same as upstream, with additional patch for `cannot convert float infinity to integer`
  * https://github.com/dagwieers/dstat
* sys-apps/liquidctl
  * Cross-platform CLI and Python drivers for AIO liquid coolers and other devices 
  * https://github.com/liquidctl/liquidctl
* sys-apps/skiller-ctl
  * Control the additional features (e.g., LEDs) of Sharkoon Skiller (Pro/Pro+) keyboards
  * https://github.com/anyc/skiller-ctl
* sys-apps/zenmonitor
  * Monitoring software for AMD Zen-based CPUs
  * https://github.com/ocerman/zenmonitor
* sys-apps/zenmonitor3
  * Monitoring software for AMD Zen-based CPUs with Zen 3 support
  * https://github.com/Ta180m/zenmonitor3
* sys-kernel/it87
  * IT87 sensors module
  * https://github.com/a1wong/it87
* sys-kernel/zenpower
  * Linux kernel driver for reading sensors of AMD Zen family CPUs
  * https://github.com/Ta180m/zenpower3
* x11-apps/xfhd
  * xfhd is a utility for resizing an X window to Full HD
  * https://github.com/r41d/xfhd
