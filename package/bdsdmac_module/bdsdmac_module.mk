################################################################################
#
# bdsdmac_module
#
################################################################################

BDSDMAC_MODULE_VERSION = 16065dca774455e189c0ecbb7557b6ee41a6e588
BDSDMAC_MODULE_SITE = \
	$(call github,boundarydevices,qcacld-2.0,$(BDSDMAC_MODULE_VERSION))
BDSDMAC_MODULE_LICENSE = ISC, BSD-like, GPL-2.0+
BDSDMAC_MODULE_DEPENDENCIES = linux

define BDSDMAC_MODULE_BUILD_CMDS
	cd $(@D); \
	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
		ARCH=$(KERNEL_ARCH) CONFIG_CLD_HL_SDIO_CORE=y KERNEL_SRC=$(LINUX_DIR)
endef

define BDSDMAC_MODULE_INSTALL_TARGET_CMDS
	cd $(@D); \
	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
		ARCH=$(KERNEL_ARCH) KERNEL_SRC=$(LINUX_DIR) \
		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef

$(eval $(generic-package))
