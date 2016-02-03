BLDAEMON_ZIPIT_VERSION = master 
BLDAEMON_ZIPIT_SITE = $(call github,mozzwald,bldaemon-zipit,$(BLDAEMON_ZIPIT_VERSION))

define BLDAEMON_ZIPIT_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) -lrt -lpthread $(@D)/bldaemon.c -o $(@D)/bldaemon
endef

define BLDAEMON_ZIPIT_INSTALL_TARGET_CMDS
	cp -f $(@D)/bldaemon $(TARGET_DIR)/usr/sbin
	cp -f $(BR2_EXTERNAL)/package/bldaemon-zipit/files/S99z2-bldaemon.init $(TARGET_DIR)/etc/init.d/S99z2-bldaemon
	cp -a $(BR2_EXTERNAL)/package/bldaemon-zipit/files/S99z2-bldaemon $(TARGET_DIR)/etc/rc.d
endef

$(eval $(generic-package))
