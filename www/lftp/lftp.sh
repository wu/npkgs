#!/bin/bash

PKG_NAME="lftp"
PACKAGE="$PKG_NAME-4.3.2"
TARBALL="$PACKAGE.tar.gz"
URL="http://ftp.yars.free.net/pub/source/lftp/$TARBALL"
PREREQS="openssl readline"

# source common envs
. ../../common.sh

export CC=gcc
export CXX=g++
CONFIGURE="$CONFIGURE --with-openssl=$PREFIX/root/openssl"

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
