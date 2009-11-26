#!/bin/bash

PKG_NAME="fontconfig"
PACKAGE="$PKG_NAME-2.7.3"
TARBALL="$PACKAGE.tar.gz"
URL="http://fontconfig.org/release/$TARBALL"

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
