#!/bin/bash

PKG_NAME="clusterit"
PACKAGE="$PKG_NAME-2.5"
TARBALL="$PACKAGE.tar.gz"
URL="http://sourceforge.net/projects/clusterit/files/$PKG_NAME/$PACKAGE/$TARBALL/download"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_fetch
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

common_configure
common_make
common_install
common_install_links
