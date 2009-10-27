#!/bin/bash

PKG_NAME="pango"
PKG_VERSION="1.26"
PACKAGE="$PKG_NAME-$PKG_VERSION.0"
TARBALL="$PACKAGE.tar.bz2"
URL="http://ftp.gnome.org/pub/gnome/sources/pango/$PKG_VERSION/$TARBALL"
PREREQS="cairo"

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

#cp /usr/local/npkg/x11/pango/work/pango-1.26.0/pango/pangofc-* /usr/local/include/pango-1.0/pango/

common_install_links
