#!/bin/bash

PKG_NAME="ghostscript"
PKG_VER="8.64"
PACKAGE="$PKG_NAME-$PKG_VER"
TARBALL="$PACKAGE.tar.bz2"
URL="http://ghostscript.com/releases/ghostscript-8.64.tar.bz2"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --disable-cups"

common_fetch
common_prereqs
common_clean
common_untar_bzip

# build and install
cd $PACKAGE                        || exit

common_configure
common_make
common_install
common_install_links
