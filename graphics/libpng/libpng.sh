#!/bin/bash

PKG_NAME="libpng"
PACKAGE="$PKG_NAME-1.2.35"
TARBALL="$PACKAGE.tar.gz"
URL="http://superb-east.dl.sourceforge.net/sourceforge/libpng/$TARBALL"

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
