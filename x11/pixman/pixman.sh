#!/bin/bash

PKG_NAME="pixman"
PACKAGE="$PKG_NAME-0.16.2"
TARBALL="$PACKAGE.tar.gz"
URL="http://cairographics.org/releases/$TARBALL"

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
