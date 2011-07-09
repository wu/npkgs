#!/bin/bash

PKG_NAME="curl"
PACKAGE="$PKG_NAME-7.21.7"
TARBALL="$PACKAGE.tar.gz"
URL="http://curl.haxx.se/download/$TARBALL"
PREREQS="openssl"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-ssl=$PREFIX"

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
