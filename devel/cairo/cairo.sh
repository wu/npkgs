#!/bin/bash

PKG_NAME="cairo"
PACKAGE="$PKG_NAME-1.8.8"
TARBALL="$PACKAGE.tar.gz"
URL="http://cairographics.org/releases/$TARBALL"
PREREQS="pixman libpng fontconfig"

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
