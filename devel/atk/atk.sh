#!/bin/bash

PKG_NAME="atk"
PACKAGE="$PKG_NAME-1.26.0"
TARBALL="$PACKAGE.tar.bz2"
URL="http://ftp.gnome.org/pub/gnome/sources/atk/1.26/$TARBALL"

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
