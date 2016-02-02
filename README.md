# Zipit Z2 Buildroot External
This is an external buildroot configuration for the Zipit Z2 Handheld, tested with Buildroot 2015.11. It's currently a work-in-progress.
NOTE: Only tested from SD Card image thus far.

## Usage
Clone the [Buildroot](http://git.buildroot.net/buildroot) repo (or download tarball) and this repo

For a SD Card bootable image, in the Buildroot directory run:

     make BR2_EXTERNAL=/path/to/zipitz2-buildroot-external zipitz2_defconfig

This will tell Buildroot to use the files in this repo. You can now build Buildroot running _make_ or configure further with _make menuconfig_, _make linux-menuconfig_, or _make busybox-menuconfig_. 

## JFFS Usage
Maximum sizes to fit internal NOR flash on the Zipit:

- Kernel (MTD2): 1,179,648 Bytes
- JFFS   (MTD3): 6,684,672 Bytes

For a flashable jffs2 image (for internal 8MB NOR):

     make BR2_EXTERNAL=/path/to/zipitz2-buildroot-external zipitz2_jffs_defconfig

## Saving your changes
Thanks to [xSmurf](https://github.com/xSmurf/coreboot_buildroot_project) for this save script. This will save your linux, busybox and buildroot configs back to the external-buildroot repo (this dir). To use, run the following from your Buildroot dir:

     /path/to/zipitz2-buildroot-external/scripts/save.sh

## WiFi
I added in the _wpa-connect_ script from openwrt-zipit. Edit _/etc/wpa.conf_ with your proper access point settings and run _wpa-connect_ to connect.

## Zipit Console Settings
The zipit keymap and screen font are loaded in _/etc/inittab_. Slug_'s version of [bldaemon-zipit](https://github.com/engine12/bldaemon-zipit) is included to handle LCD and keyboard backlights.

## TODO
- Fix mtd partition layout in kernel to match openwrt
- Slim down busybox
- Create suspend script (disable/renable wifi)
- ntp/htpdate/? time sync
- wifi search/add script?
- put zipit specific scripts into menuconfig as indivdual packages?
- lots more, I'm sure :-)
