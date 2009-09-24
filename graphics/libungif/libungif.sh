#!/bin/bash

PKG_NAME="libungif"
PACKAGE="$PKG_NAME-4.1.4"
TARBALL="$PACKAGE.tar.gz"
URL="http://downloads.sourceforge.net/project/giflib/libungif%204.x/$PACKAGE/$TARBALL"

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
