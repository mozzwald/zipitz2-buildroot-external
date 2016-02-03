HTPDATE_VERSION = 1.1.3
HTPDATE_SOURCE = htpdate-$(HTPDATE_VERSION).tar.gz
HTPDATE_SITE = http://www.vervest.org/htp/archive/c
HTPDATE_LICENSE = GPL

define HTPDATE_BUILD_CMDS
	$(TARGET_CC) -I$(STAGING_DIR)/usr/include/ $(TARGET_CFLAGS) -C $(@D)/htpdate.c -o $(@D)/htpdate
endef

define HTPDATE_INSTALL_TARGET_CMDS
	cp -f $(@D)/htpdate $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))