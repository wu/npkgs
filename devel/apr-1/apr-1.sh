#!/bin/bash

PKG_NAME="apr-1"
PACKAGE="$PKG_NAME.3.3"
TARBALL="$PACKAGE.tar.gz"
URL="http://mirror.olnevhost.net/pub/apache/apr/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                           || exit

common_configure
common_make
common_install
common_install_links
