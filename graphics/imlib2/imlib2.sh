#!/bin/bash

PKG_NAME="imlib2"
PACKAGE="$PKG_NAME-1.4.2"
TARBALL="$PACKAGE.tar.gz"
URL="http://voxel.dl.sourceforge.net/sourceforge/enlightenment/$TARBALL"
PREREQS="freetype1 libpng"

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
