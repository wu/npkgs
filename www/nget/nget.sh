#!/bin/bash

PKG_NAME="nget"
PACKAGE="$PKG_NAME-0.27.1"
TARBALL="$PACKAGE+uulib.tar.gz"
URL="http://prdownloads.sourceforge.net/nget/$TARBALL?download"

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
