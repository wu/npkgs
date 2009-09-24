#!/bin/bash

PKG_NAME="jpeg"
PKG_VER="7"
PACKAGE="${PKG_NAME}src.v$PKG_VER"
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
cd jpeg-$PKG_VER                        || exit

common_configure

ln -s /usr/bin/glibtool ./libtool

common_make

mkdir -p $PKG_PREFIX $PKG_PREFIX/bin $PKG_PREFIX/man/man1 $PKG_PREFIX/include $PKG_PREFIX/lib

common_install
common_install_links
