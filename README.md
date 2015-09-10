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

* app-admin/berkshelf
  * A Chef Cookbook manager
  * https://github.com/berkshelf/berkshelf
* app-admin/chefdk-omnibus
  * Omnibus installation of ChefDK
  * https://downloads.chef.io/chef-dk/
  * berks and kitchen are not installed to the $PATH, you can use *app-admin/berkshelf* and *app-admin/test-kitchen*
* app-admin/kitchen-vagrant
  * A Vagrant Driver for Test Kitchen
  * https://github.com/test-kitchen/kitchen-vagrant
* app-admin/test-kitchen
  * Test Kitchen is an integration tool for developing and testing infrastructure code and software on isolated target platforms
  * https://github.com/test-kitchen/test-kitchen
  * http://kitchen.ci/
* app-emulation/vagrant
  * A tool for building and distributing virtual machines using VirtualBox
  * https://www.vagrantup.com/
