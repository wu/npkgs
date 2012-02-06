#!/bin/bash

PKG_NAME="tiff"
PACKAGE="$PKG_NAME-4.0.0"
TARBALL="$PACKAGE.tar.gz"
URL="ftp://ftp.remotesensing.org/pub/libtiff/$TARBALL"

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
