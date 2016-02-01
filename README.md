# Zipit Z2 Buildroot External
This is an external buildroot configuration for the Zipit Z2 Handheld, tested with Buildroot 2015.11. It's currently a work-in-progress and no builds have been 
tested yet.

## Usage
Clone the [Buildroot](http://git.buildroot.net/buildroot) repo and this repo

In the Buildroot directory run:

     make BR2_EXTERNAL=/path/to/this/dir zipitz2_defconfig

for tarball image (SD Card) or:

     make BR2_EXTERNAL=/path/to/this/dir zipitz2_jffs_defconfig

for a small jffs2 image (internal NOR flash). This will tell Buildroot to use the files in this repo. You can now build Buildroot running _make_ or configure further with _make menuconfig_, _make linux-menuconfig_, or _make busybox-config_. 

## JFFS / Kernel Size
Sizes required to fit internal NOR flash on the zipit:

- Kernel (MTD2): 1,179,648 Bytes
- JFFS   (MTD3): 6,684,672 Bytes
