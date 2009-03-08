#!/bin/bash

PKG_NAME="gzip"
PACKAGE="$PKG_NAME-1.3.9"
TARBALL="$PACKAGE.tar.gz"
URL="http://ftp.gnu.org/pub/gnu/gzip/$TARBALL"

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
