#!/bin/bash

PKG_NAME="expat"
PKG_VERSION="2.1.0"
PACKAGE="$PKG_NAME-$PKG_VERSION"
TARBALL="$PACKAGE.tar.gz"
URL="http://downloads.sourceforge.net/project/expat/expat/$PKG_VERSION/$TARBALL"

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
