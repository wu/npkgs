#!/bin/bash

PKG_NAME="tk"
PACKAGE="${PKG_NAME}8.5.6"
TARBALL="$PACKAGE-src.tar.gz"
URL="http://superb-west.dl.sourceforge.net/sourceforge/tcl/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install

cd $PACKAGE/unix                     || exit
common_configure
common_make
common_install

common_install_links

