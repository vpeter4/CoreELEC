# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.tv)

PKG_NAME="mt76x8"
PKG_VERSION="b95205b6b4736d3d83c94b9c967d2b84f43210a0"
PKG_SHA256="6f727c35bb0c2681d897f13fb9d0a8eecb0a20f10abcf1323c6beaee899f3f70"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/CoreELEC/mt76x8"
PKG_URL="https://github.com/CoreELEC/mt76x8/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="mt76x8 Linux driver"
PKG_IS_KERNEL_PKG="yes"
PKG_TOOLCHAIN="manual"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  echo
  echo "making bluetooth"
  make EXTRA_CFLAGS="-w" \
    LINUX_SRC=$(kernel_path) \
    ARCH=$TARGET_KERNEL_ARCH \
    CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
    -C bluetooth/sdio -f Makefile

  echo
  echo "making wlan"
  make EXTRA_CFLAGS="-w" \
    LINUX_SRC=$(kernel_path) \
    ARCH=$TARGET_KERNEL_ARCH \
    CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
    -C wlan -f Makefile
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    find $PKG_BUILD/ -name \*.ko -not -path '*/\.*' -exec cp {} $INSTALL/$(get_full_module_dir)/$PKG_NAME \;

  mkdir -p $INSTALL/$(get_full_firmware_dir)
    cp $PKG_BUILD/wlan/firmware/* $INSTALL/$(get_full_firmware_dir)
}
