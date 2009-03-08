#!/bin/bash

PKG_NAME="glib"
PACKAGE="$PKG_NAME-2.19.9"
TARBALL="$PACKAGE.tar.gz"
URL="ftp://ftp.gtk.org/pub/glib/2.19/$TARBALL"
PREREQS="gettext"

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
