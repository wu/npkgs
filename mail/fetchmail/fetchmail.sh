#!/bin/bash

PKG_NAME="fetchmail"
PACKAGE="$PKG_NAME-6.3.16"
TARBALL="$PACKAGE.tar.bz2"
URL="http://download.berlios.de/fetchmail/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar_bzip

# build and install
cd $PACKAGE                          || exit

common_configure
common_make

common_install
common_install_links
