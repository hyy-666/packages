include $(TOPDIR)/rules.mk

PKG_NAME:=qBittorrent-Enhanced-Edition
PKG_VERSION:=4.3.5.10
PKG_RELEASE=$(AUTORELEASE)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/c0re100/qBittorrent-Enhanced-Edition/tar.gz/release-$(PKG_VERSION)?
PKG_HASH:=fad92853b0d2473153f46d27caefac2776f02218ac94e35aabe81bfdbbc43a69

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-release-$(PKG_VERSION)

PKG_LICENSE:=GPL-2.0+
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SUBMENU:=BitTorrent
  SECTION:=net
  CATEGORY:=Network
  TITLE:=bittorrent client programmed in C++ / Qt
  URL:=https://github.com/c0re100/qBittorrent-Enhanced-Edition
  DEPENDS:=+boost +rblibtorrent +python3 +qt5-core +qt5-network +qt5-sql +qt5-xml
endef

define Package/$(PKG_NAME)/description
qBittorrent is a bittorrent client programmed in C++ / Qt that uses
libtorrent (sometimes called libtorrent-rasterbar) by Arvid Norberg.
It aims to be a good alternative to all other bittorrent clients out
there. qBittorrent is fast, stable and provides unicode support as
well as many features.
endef

CONFIGURE_ARGS += \
	--disable-gui \
	--enable-stacktrace=no \
	--with-boost=$(STAGING_DIR)/usr

MAKE_VARS += \
	INSTALL_ROOT="$(PKG_INSTALL_DIR)"

define Build/Prepare
	$(call Build/Prepare/Default)
	$(SED) '/<context>/{:a;N;/<\/context>/!ba;/\/gui\//d}' `ls $(PKG_BUILD_DIR)/src/lang/qbittorrent_*.ts`
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/qbittorrent-nox $(1)/usr/bin/
	mv $(1)/usr/bin/qbittorrent-nox $(1)/usr/bin/qBittorrentEE-nox
endef

$(eval $(call BuildPackage,$(PKG_NAME)))