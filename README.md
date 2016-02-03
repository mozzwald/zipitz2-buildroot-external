# Zipit Z2 Buildroot External
This is an external buildroot configuration for the Zipit Z2 Handheld, tested with Buildroot 2015.11. Your Zipit needs to have the u-boot bootloader instead of the stock blob bootloader. See [this](http://mozzwald.com/articles/z2uflashstock-v0-3) if you need to install u-boot. 

This is a work-in-progress.

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

This will tell Buildroot to use the files in this repo. You can now build Buildroot running _make_ or configure further with _make menuconfig_, _make linux-menuconfig_, or _make busybox-menuconfig_. 

To install the image to internal flash you need a SD card/rootfs that has the proper partitions setup. You could do the Buildroot SD image (see above) or use an already available rootfs like Slug_'s [openwrt-gmenu2x-jffs](http://engine12.com/files/gmenu-zipit/gmenu_jffs2_rc23.tar.bz2). Copy from Buildroot _output/images/rootfs.jffs2_ and _output/images/uImage_ to the SD card rootfs. After bootup, copy the files to the proper mtdblocks:

     dd if=uImage of=/dev/mtdblock2        # Kernel
     dd if=rootfs.jffs2 of=/dev/mtdblock3  # rootfs

## Saving your changes
Thanks to [xSmurf](https://github.com/xSmurf/coreboot_buildroot_project) for this save script. This will save your linux, busybox and buildroot configs back to the external-buildroot repo (this dir). To use, run the following from your Buildroot dir:

     /path/to/zipitz2-buildroot-external/scripts/save.sh

## WiFi
I added in the _wpa-connect_ script from openwrt-zipit. Edit _/etc/wpa.conf_ with your proper access point settings and run _wpa-connect_ to connect.

## Zipit Console Settings
The zipit keymap and screen font are loaded in _/etc/inittab_. Slug_'s version of [bldaemon-zipit](https://github.com/engine12/bldaemon-zipit) is included to handle LCD and keyboard backlights.

## TODO
- ~~Fix mtd partition layout in kernel to match openwrt~~
- Slim down busybox
- Create suspend script (disable/renable wifi)
- ~~ntp/htpdate/? time sync~~
- wifi search/add script?
- put zipit specific scripts into menuconfig as indivdual packages?
- lots more, I'm sure :-)
