#!/bin/bash

PKG_NAME="libevent"
PKG_VERSION="2.0.13"
PACKAGE="$PKG_NAME-$PKG_VERSION-stable"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.monkey.org/~provos/$TARBALL"

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
