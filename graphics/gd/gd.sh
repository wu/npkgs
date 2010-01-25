#!/bin/bash

PKG_NAME="gd"
PKG_VER="2.0.36RC1"
PACKAGE="$PKG_NAME-$PKG_VER"
TARBALL="$PACKAGE.tar.bz2"
URL="http://www.libgd.org/releases/$TARBALL"

# source common envs
. ../../common.sh

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
