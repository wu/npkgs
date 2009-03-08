#!/bin/bash

PKG_NAME="pkg-config"
PACKAGE="$PKG_NAME-0.23"
TARBALL="$PACKAGE.tar.gz"
URL="http://pkgconfig.freedesktop.org/releases/$TARBALL"

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
