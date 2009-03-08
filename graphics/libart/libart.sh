#!/bin/bash

PKG_NAME="libart"
PACKAGE="${PKG_NAME}_lgpl-2.3.20"
TARBALL="$PACKAGE.tar.gz"
URL="http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/$TARBALL"

# source common envs
. ../../common.sh

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
