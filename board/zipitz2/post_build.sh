#!/bin/bash
BOARD_NAME=`cat "$BR2_CONFIG" | grep "BR2_DEFCONFIG" | sed 's#.*/##g' | sed 's#_defconfig.*##'`
BOARDS_PATH=$(dirname $(dirname $BASH_SOURCE))
OVERLAY_PATH=$BOARDS_PATH/rootfs-overlays
COMMON_OVERLAY=$OVERLAY_PATH/common
BOARD_OVERLAY=$OVERLAY_PATH/$BOARD_NAME

cp -rf $COMMON_OVERLAY/* $TARGET_DIR/
cp -rf $BOARD_OVERLAY/* $TARGET_DIR/

# Remove mdev init script. We run mdev from inttab instead
rm -f $TARGET_DIR/etc/rc.d/*mdev
rm -f $TARGET_DIR/etc/init.d/*mdev
