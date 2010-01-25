#!/bin/bash

PKG_NAME="gnuplot"
PKG_VER="4.2.6"
PACKAGE="$PKG_NAME-$PKG_VER"
TARBALL="$PACKAGE.tar.gz"
URL="http://sourceforge.net/projects/gnuplot/files/gnuplot/$PKG_VER/$TARBALL/download"
PREREQS="gd ghostscript"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --disable-wxwidgets"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                        || exit

common_configure
common_make
common_install
common_install_links
