#!/bin/sh
MKIMG_BIN=`which mkimage`
if [ $? -ne 0 ]; then
	echo "This script requires uboot-envtools mkimage program"
	exit 1
fi

"$MKIMG_BIN" -A arm -O u-boot -T script -C none -a 0 -e 0 -n uboot.script -d uboot.script.base uboot.script
