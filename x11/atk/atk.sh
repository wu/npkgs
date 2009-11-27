#!/bin/bash

PKG_NAME="atk"
PKG_VERSION="1.28"
PACKAGE="$PKG_NAME-$PKG_VERSION.0"
TARBALL="$PACKAGE.tar.bz2"
URL="http://ftp.gnome.org/pub/gnome/sources/atk/$PKG_VERSION/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar_bzip

# build and install
cd $PACKAGE                          || exit

common_configure
common_make
common_install
common_install_links
