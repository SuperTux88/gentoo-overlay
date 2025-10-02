# SuperTux88 Gentoo overlay

Current build status: [![pkgcheck](https://github.com/SuperTux88/gentoo-overlay/actions/workflows/ci.yml/badge.svg)](https://github.com/SuperTux88/gentoo-overlay/actions/workflows/ci.yml)

## use at your own risk

Ebuilds are mostly provided "as is", as I only develop them for my own use-cases and can only test them on my environments, so they might not work as expected in some edge-cases.
If you encounter a bug in an ebuild, you are welcome to open an issue, but there are no guarantees I'll fix them, as I might not be able to reproduce/test them in my environments.
If you already know the fix, you can also create a PR, which I'm able to merge even when I can't reproduce/test the original issue, as long as it doesn't break anything for my use-cases.

Ebuilds might be removed at any time, when I don't need something anymore and don't want to continue maintaining the ebuilds for it.

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
* app-arch/nfpm
  * nFPM is Not FPM - a simple deb, rpm, apk, ipk, and arch linux packager written in Go
  * https://nfpm.goreleaser.com
* app-laptop/fw-ectool
  * ectool for the Framework laptop
  * https://gitlab.howett.net/DHowett/ectool
* app-laptop/fw-fanctrl
  * A simple systemd service to better control Framework Laptop's fan(s)
  * https://github.com/TamtamHero/fw-fanctrl
* app-misc/csvlens
  * Command line csv viewer
  * https://github.com/YS-L/csvlens
* app-misc/google-cloud-cli
  * Google Cloud SDK
  * https://cloud.google.com/sdk
* app-misc/google-cloud-cli-gke-gcloud-auth-plugin
  * A google-cloud-sdk component that provides a kubectl authentication plugin for GKE
  * https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
* app-misc/htmlq
  * Like jq, but for HTML
  * https://github.com/mgdm/htmlq
* app-misc/sl-patched
  * SL (Steam Locomotive) runs across your terminal when you type "sl" as you meant to type "ls"
  * Old patched long version, inspired by https://aur.archlinux.org/packages/sl-patched
  * Patch from https://github.com/euank/docker-sl
* app-misc/spacer
  * CLI tool to insert spacers when command output stops
  * https://github.com/samwho/spacer
* app-shells/gitstatus
  * Git status for Bash and Zsh prompt
  * https://github.com/romkatv/gitstatus
* app-shells/powerlevel10k
  * A theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience
  * https://github.com/romkatv/powerlevel10k
* dev-util/cargo-auditable
  * Make production Rust binaries auditable
  * https://github.com/rust-secure-code/cargo-auditable
* dev-util/bacon
  * background rust code check
  * https://github.com/Canop/bacon
* dev-util/cargo-deny
  * Cargo plugin for linting your dependencies
  * https://github.com/EmbarkStudios/cargo-deny
* dev-util/cargo-expand
  * Wrapper around rustc -Zunpretty=expanded. Shows the result of macro expansion and #[derive] expansion.
  * https://github.com/dtolnay/cargo-expand
* dev-util/cargo-geiger
  * Detects usage of unsafe Rust in a Rust crate and its dependencies
  * https://github.com/geiger-rs/cargo-geiger
* dev-util/cargo-watch
  * Watches over your Cargo project's source
  * https://github.com/watchexec/cargo-watch
* dev-util/diesel-cli
  * Diesel CLI is a tool that aids in managing your database schema
  * https://github.com/diesel-rs/diesel/tree/master/diesel_cli
* dev-util/kopium
  * Kubernetes OPenapI UnMangler
  * https://github.com/kube-rs/kopium
* dev-util/leptosfmt
  * A formatter for the leptos view! macro
  * https://github.com/bram209/leptosfmt
* dev-util/rust-audit-info
  * Command-line tool to extract the dependency trees embedded in binaries by cargo auditable
  * https://github.com/rust-secure-code/cargo-auditable/tree/master/rust-audit-info
* dev-util/tailspin
  * A log file highlighter
  * https://github.com/bensadeh/tailspin
* dev-util/trunk
  * Build, bundle & ship your Rust WASM application to the web
  * https://trunkrs.dev
* dev-util/wasm-pack
  * Your favorite rust -> wasm workflow tool
  * https://rustwasm.github.io/wasm-pack
* dev-vcs/git-interactive-rebase-tool
  * Native cross-platform full feature terminal-based sequence editor for git interactive rebase
  * https://github.com/MitMaro/git-interactive-rebase-tool
* gnome-extra/gnome-tweaks
  * Same as upstream, with additional `gnome-shell` USE flag
* gui-apps/waybar
  * Highly customizable Wayland bar for Sway and Wlroots based compositors.
  * https://github.com/Alexays/Waybar
  * Copy of https://github.com/gentoo/gentoo/pull/43508 until it's merged to main repo
* gui-apps/wl-mirror
  * A simple Wayland output mirror client
  * https://github.com/Ferdi265/wl-mirror
* gui-libs/gtk4-layer-shell
  * A library to create panels and other desktop components for Wayland using the Layer Shell protocol and GTK4
  * Dependency for mixxc
  * https://github.com/wmww/gtk4-layer-shell
* gui-libs/sway-systemd
  * Systemd integration for Sway session
  * https://github.com/alebastr/sway-systemd
* media-fonts/meslo-nerd
  * Nerd Font build of Apple's Menlo font
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
  * https://github.com/LiveSplit/obs-livesplit-one
* media-plugins/obs-wlrobs
  * An obs-studio plugin that allows you to screen capture on wlroots based wayland compositors
  * https://hg.sr.ht/~scoopta/wlrobs
* media-sound/mixxc
  * Minimalistic and flavorful volume mixer for widget enthusiasts
  * https://github.com/Elvyria/Mixxc
* media-sound/pwvucontrol
  * Pipewire Volume Control
  * https://github.com/saivert/pwvucontrol
* media-video/libwireplumber-compat
  * Compatibility version 4.x of libwireplumber
  * Dependency for pwvucontrol (wireplumber.rs)
* net-analyzer/gobuster
  * Directory/File, DNS and VHost busting tool written in Go
  * https://github.com/OJ/gobuster
* net-analyzer/subfinder
  * Fast passive subdomain enumeration tool
  * https://github.com/projectdiscovery/subfinder
* net-im/teams-for-linux
  * Unofficial Microsoft Teams for Linux client
  * https://github.com/IsmaelMartinez/teams-for-linux
* net-misc/synology-drive-client
  * Desktop utility of the DSM add-on package Synology Drive Server
  * https://www.synology.com/en-global/releaseNote/SynologyDriveClient
* net-misc/warpinator
  * Share files across the LAN
  * https://github.com/linuxmint/warpinator
* net-misc/xh
  * Friendly and fast tool for sending HTTP requests
  * https://github.com/ducaale/xh
* sci-electronics/openhantek6022
  * a DSO software for Hantek USB digital signal oscilloscopes 6022BE / BL
  * https://github.com/OpenHantek/OpenHantek6022
* sec-keys/openpgp-keys-romkatv
  * OpenPGP keys used by Roman Perepelitsa
  * https://github.com/romkatv
* sys-apps/dool
  * Versatile replacement for vmstat, iostat and ifstat (clone of dstat)
  * https://github.com/scottchiefbaker/dool
* sys-apps/hexyl
  * A command-line hex viewer
  * https://github.com/sharkdp/hexyl
* sys-apps/jless
  * A command-line JSON viewer designed for reading, exploring, and searching through JSON data
  * https://jless.io
* sys-apps/sd
  * Intuitive find & replace CLI (sed alternative)
  * https://github.com/chmln/sd
* sys-apps/skiller-ctl
  * Control the additional features (e.g., LEDs) of Sharkoon Skiller (Pro/Pro+) keyboards
  * https://github.com/anyc/skiller-ctl
* sys-apps/zenmonitor3
  * Monitoring software for AMD Zen-based CPUs with Zen 3 support
  * https://github.com/Ta180m/zenmonitor3
* sys-cluster/kustomize-bin
  * Customization of kubernetes YAML configurations
  * https://github.com/kubernetes-sigs/kustomize
* sys-kernel/it87
  * IT87 sensors module
  * https://github.com/a1wong/it87
* sys-kernel/zenstats
  * Zenstats is a Linux kernel driver for reading temperature, voltage(SVI2), current(SVI2) and power(SVI2) for AMD Zen family CPUs
  * https://github.com/Sid127/zenstats
* sys-power/amd_s2idle
  * S0i3/s2idle analysis script for AMD systems
  * https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py
* sys-power/poweralertd
  * UPower-powered power alerter
  * https://sr.ht/~kennylevinsen/poweralertd
* sys-power/sntrack
  * Tracks the battery discharge rate during sleep
  * https://github.com/xsmile/sntrack
* sys-power/wluma
  * Automatic brightness adjustment based on screen contents and ALS
  * https://github.com/maximbaz/wluma
* www-servers/miniserve
  * A CLI tool to serve files and dirs over HTTP
  * https://github.com/svenstaro/miniserve
* x11-apps/xfhd
  * xfhd is a utility for resizing an X window to Full HD
  * https://github.com/r41d/xfhd
* x11-drivers/displaylink-driver
  * DisplayLink USB Graphics Software
  * https://www.synaptics.com/products/displaylink-graphics
* x11-drivers/evdi
  * Extensible Virtual Display Interface
  * https://github.com/DisplayLink/evdi
* x11-misc/ly
  * a TUI display manager
  * https://codeberg.org/fairyglade/ly
