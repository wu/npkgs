#!/bin/bash

PKG_NAME="nullmailer"
PACKAGE="$PKG_NAME-1.05"
TARBALL="$PACKAGE.tar.gz"
URL="http://untroubled.org/nullmailer/$TARBALL"

# source common envs
. ../../common.sh

export CC=gcc
export CXX=g++

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
