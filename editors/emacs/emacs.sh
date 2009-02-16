#!/bin/bash

PKG_NAME="emacs"
PACKAGE="$PKG_NAME-22.3"
TARBALL="$PACKAGE.tar.gz"
URL="http://ftp.gnu.org/pub/gnu/emacs/$TARBALL"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-x"

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

