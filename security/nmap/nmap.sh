#!/bin/bash

PKG_NAME="nmap"
PACKAGE="$PKG_NAME-4.90RC1"
TARBALL="$PACKAGE.tar.bz2"
URL="http://nmap.org/dist/$TARBALL"

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
