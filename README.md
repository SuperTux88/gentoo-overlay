# SuperTux88 Gentoo overlay

Current build status: [![Continuous Integration](https://github.com/SuperTux88/gentoo-overlay/workflows/CI/badge.svg)](https://github.com/SuperTux88/gentoo-overlay/actions?query=workflow%3ACI)

**use at your own risk**

## Usage

Enable it using `app-eselect/eselect-repository`:

```
eselect repository enable supertux88
```

**or**

Manually add this to `/etc/portage/repos.conf/supertux88.conf`:

```
[supertux88]
location = /var/db/repos/supertux88
sync-type = git
sync-uri = https://github.com/SuperTux88/gentoo-overlay.git
auto-sync = yes
```

**or**

Download it with:

```
wget https://raw.githubusercontent.com/SuperTux88/gentoo-overlay/master/supertux88.conf -O /etc/portage/repos.conf/supertux88.conf
```

## Packages

The following packages are available in this overlay:

* app-admin/dotter
  * A dotfile manager and templater written in rust
  * https://github.com/SuperCuber/dotter
* app-containers/dnsname-cni-plugin
  * name resolution for containers
  * https://github.com/containers/dnsname
* app-misc/google-cloud-cli
  * Google Cloud SDK
  * https://cloud.google.com/sdk
* app-misc/google-cloud-cli-gke-gcloud-auth-plugin
  * A google-cloud-sdk component that provides a kubectl authentication plugin for GKE
  * https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
* app-shells/gitstatus
  * Git status for Bash and Zsh prompt
  * https://github.com/romkatv/gitstatus
* app-shells/powerlevel10k
  * A theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience
  * https://github.com/romkatv/powerlevel10k
* dev-util/cargo-expand
  * Wrapper around rustc -Zunpretty=expanded. Shows the result of macro expansion and #[derive] expansion.
  * https://github.com/dtolnay/cargo-expand
* dev-util/cargo-watch
  * Watches over your Cargo project's source
  * https://github.com/watchexec/cargo-watch
* dev-util/trunk
  * Build, bundle & ship your Rust WASM application to the web
  * https://trunkrs.dev
* dev-util/wasm-pack
  * Your favorite rust -> wasm workflow tool
  * https://rustwasm.github.io/wasm-pack
* gnome-extra/gnome-tweaks
  * Same as upstream, with additional `gnome-shell` USE flag
* gui-apps/clipman
  * A simple clipboard manager for Wayland
  * https://github.com/yory8/clipman
* gui-apps/wev
  * wayland event viewer
  * https://git.sr.ht/~sircmpwn/wev
* gui-apps/wl-mirror
  * A simple Wayland output mirror client
  * https://github.com/Ferdi265/wl-mirror
* gui-apps/wluma
  * Automatic brightness adjustment based on screen contents and ALS
  * https://github.com/maximbaz/wluma
* gui-apps/ydotool
  * Generic command-line automation tool (no X!)
  * https://github.com/ReimuNotMoe/ydotool
* kde-plasma/breeze
  * Same as upstream, with additional `kde-cli-tools` USE flag
* media-fonts/meslo-nerd
  * Nerd Font build of Apple's Menlo font
  * https://github.com/ryanoasis/nerd-fonts
* media-fonts/nerd-fonts-symbols
  * High number of extra glyphs from popular 'iconic fonts'
  * https://github.com/ryanoasis/nerd-fonts
* media-fonts/terminess-nerd
  * Nerd Font build of Terminus font
  * https://github.com/ryanoasis/nerd-fonts
* media-fonts/terminus-ttf
  * A TrueType version of Terminus Font
  * https://files.ax86.net/terminus-ttf/
* media-gfx/corrupter
  * Simple image glitcher suitable for producing nice looking lockscreens
  * https://github.com/r00tman/corrupter
* media-plugins/obs-backgroundremoval
  * OBS plugin for removing backgrounds
  * https://github.com/royshil/obs-backgroundremoval
* media-plugins/obs-livesplit-one
  * A plugin for OBS Studio that allows adding LiveSplit One as a source
  * https://github.com/CryZe/obs-livesplit-one
* media-plugins/obs-vkcapture
  * OBS Linux Vulkan/OpenGL game capture
  * https://github.com/nowrep/obs-vkcapture
* media-plugins/obs-wlrobs
  * An obs-studio plugin that allows you to screen capture on wlroots based wayland compositors
  * https://hg.sr.ht/~scoopta/wlrobs
* media-sound/qpwgraph
  * PipeWire Graph Qt GUI Interface
  * https://gitlab.freedesktop.org/rncbc/qpwgraph
* net-im/teams-for-linux
  * Unofficial Microsoft Teams for Linux client
  * https://github.com/IsmaelMartinez/teams-for-linux
* net-misc/synology-drive-client
  * Desktop utility of the DSM add-on package Synology Drive Server
  * https://www.synology.com/en-global/releaseNote/SynologyDriveClient
* net-misc/warpinator
  * Share files across the LAN
  * https://github.com/linuxmint/warpinator
* sci-electronics/openhantek6022
  * a DSO software for Hantek USB digital signal oscilloscopes 6022BE / BL
  * https://github.com/OpenHantek/OpenHantek6022
* sys-apps/dool
  * Versatile replacement for vmstat, iostat and ifstat (clone of dstat)
  * https://github.com/scottchiefbaker/dool
* sys-apps/jless
  * A command-line JSON viewer designed for reading, exploring, and searching through JSON data
  * https://jless.io
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
* x11-misc/ly
  * a TUI display manager
  * https://github.com/fairyglade/ly
