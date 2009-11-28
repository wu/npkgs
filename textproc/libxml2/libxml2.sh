#!/bin/bash

PKG_NAME="libxml2"
PACKAGE="$PKG_NAME-2.6.32"
TARBALL="$PACKAGE.tar.gz"
URL="ftp://xmlsoft.org/libxml2/$TARBALL"

# source common envs
. ../../common.sh

#common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

common_configure
common_make
common_install
common_install_links
