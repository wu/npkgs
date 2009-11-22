#!/bin/bash

PKG_NAME="giblib"
PACKAGE="$PKG_NAME-1.2.4"
TARBALL="$PACKAGE.tar.gz"
URL="http://linuxbrit.co.uk/downloads/$TARBALL"

# source common envs
. ../../common.sh

export CC=gcc

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


