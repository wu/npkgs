#!/bin/bash

PKG_NAME="neon"
PACKAGE="$PKG_NAME-0.28.3"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.webdav.org/neon/$TARBALL"
PREREQS="openssl"

# source common envs
. ../../common.sh

#CONFIGURE="$CONFIGURE --with-ssl=openssl --with-libs=$PREFIX --enable-shared=yes"
CONFIGURE="$CONFIGURE --with-ssl=openssl --with-libs=$PREFIX"

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

