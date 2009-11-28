#!/bin/bash

PKG_NAME="libgcrypt"
PACKAGE="$PKG_NAME-1.4.4"
TARBALL="$PACKAGE.tar.bz2"
URL="ftp://ftp.gnupg.org/gcrypt/libgcrypt/$TARBALL"

# source common envs
. ../../common.sh

export CC=gcc

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
