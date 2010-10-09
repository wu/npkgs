#!/bin/bash

PKG_NAME="pcre"
PACKAGE="$PKG_NAME-8.10"
TARBALL="$PACKAGE.tar.gz"
URL="http://easynews.dl.sourceforge.net/sourceforge/$PKG_NAME/$TARBALL"

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

