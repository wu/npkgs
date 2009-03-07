#!/bin/bash

PKG_NAME="gnupg"
PACKAGE="$PKG_NAME-1.4.9"
TARBALL="$PACKAGE.tar.bz2"
URL="ftp://ftp.gnupg.org/gcrypt/gnupg/$TARBALL"

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
