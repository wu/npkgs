#!/bin/bash

PKG_NAME="xz"
PACKAGE="$PKG_NAME-5.0.4"
TARBALL="$PACKAGE.tar.gz"
URL="http://tukaani.org/$PKG_NAME/$TARBALL"

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
