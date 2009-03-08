#!/bin/bash

PKG_NAME="rrdtool"
PACKAGE="$PKG_NAME-1.2.30"
TARBALL="$PACKAGE.tar.gz"
URL="http://oss.oetiker.ch/rrdtool/pub/$TARBALL"
PREREQ="imlib2 freetype2 libart"

# source common envs
. ../../common.sh

# help find freetyp libs
export LDFLAGS="-L$PREFIX/root/freetype2/lib -L$PREFIX/root/libart/lib $LDFLAGS"
export CPPFLAGS="-I$PREFIX/root/freetype2/include/freetype2 -I$PREFIX/root/libart/include/libart-2.0 $CPPFLAGS"

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