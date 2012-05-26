#!/bin/bash

PKG_NAME="sqlite"
PKG_VER="3071201"

PACKAGE="$PKG_NAME-autoconf-$PKG_VER"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.sqlite.org/$TARBALL"

PREREQS="readline"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                           || exit

common_configure -DSQLITE_MAX_EXPR_DEPTH=5000
common_make
common_install
common_install_links
