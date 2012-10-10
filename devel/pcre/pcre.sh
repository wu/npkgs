#!/bin/bash

PKG_NAME="pcre"
PKG_VER="8.31"
PACKAGE="$PKG_NAME-$PKG_VER"
TARBALL="$PACKAGE.tar.gz"
URL="http://downloads.sourceforge.net/project/pcre/pcre/$PKG_VER/$TARBALL"

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

