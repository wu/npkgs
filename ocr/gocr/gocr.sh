#!/bin/bash

PKG_NAME="gocr"
PKG_VER="0.47"
PACKAGE="$PKG_NAME-$PKG_VER"
TARBALL="$PACKAGE.tar.gz"
URL="http://prdownloads.sourceforge.net/jocr/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                           || exit

common_configure
common_make
common_install
common_install_links
