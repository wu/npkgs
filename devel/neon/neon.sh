#!/bin/bash

PKG_NAME="neon"
PACKAGE="$PKG_NAME-0.29.6"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.webdav.org/neon/$TARBALL"
PREREQS="openssl expat"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-ssl=openssl                                           \
                      --with-expat                                                 \
                      --enable-shared=yes                                          \
                      "

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
