#!/bin/bash

PKG_NAME="sqlite"
PKG_VER="3.6.16"
PACKAGE="$PKG_NAME-$PKG_VER"
TARBALL="$PKG_NAME-amalgamation-$PKG_VER.tar.gz"
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

common_configure
common_make
common_install
common_install_links
