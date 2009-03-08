#!/bin/bash

PKG_NAME="irssi"
PACKAGE="$PKG_NAME-0.8.12"
TARBALL="$PACKAGE.tar.gz"
URL="http://irssi.org/files/$TARBALL"
PREREQS="pkg-config glib"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-proxy --with-textui"

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
