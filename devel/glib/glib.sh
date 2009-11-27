#!/bin/bash

PKG_NAME="glib"
PKG_VERSION="2.22"
PACKAGE="$PKG_NAME-$PKG_VERSION.2"
TARBALL="$PACKAGE.tar.gz"
URL="ftp://ftp.gtk.org/pub/glib/$PKG_VERSION/$TARBALL"
PREREQS="gettext libiconv"

# source common envs
. ../../common.sh

export CONFIGURE="$CONFIGURE --with-libiconv=gnu"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

common_configure
common_make
common_install
common_install_links
