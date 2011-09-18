#!/bin/bash

PKG_NAME="readline"
PACKAGE="$PKG_NAME-6.2"
TARBALL="$PACKAGE.tar.gz"
URL="ftp://ftp.cwru.edu/pub/bash/$TARBALL"

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

