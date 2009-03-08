#!/bin/bash

PKG_NAME="jpeg"
PACKAGE="${PKG_NAME}src.v6b"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.ijg.org/files/$TARBALL"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --enable-shared"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd jpeg-6b                          || exit

common_configure

ln -s /usr/bin/glibtool ./libtool

common_make

mkdir -p $PKG_PREFIX $PKG_PREFIX/bin $PKG_PREFIX/man/man1 $PKG_PREFIX/include $PKG_PREFIX/lib

common_install
common_install_links

