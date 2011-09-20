#!/bin/bash

PKG_NAME="tmux"
PKG_VERSION="1.5"
PACKAGE="$PKG_NAME-$PKG_VERSION"
TARBALL="$PACKAGE.tar.gz"
URL="http://downloads.sourceforge.net/$PKG_NAME/$TARBALL"

PREREQS="libevent"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --disable-dependency-tracking"
LDFLAGS="$LDFLAGS -lresolv"

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
