#!/bin/bash

PKG_NAME="m4"
PACKAGE="$PKG_NAME-1.4.16"
TARBALL="$PACKAGE.tar.gz"
URL="http://ftp.gnu.org/gnu/m4/$TARBALL"

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
