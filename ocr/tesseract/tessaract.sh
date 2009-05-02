#!/bin/bash

PKG_NAME="tesseract"
PKG_VER="1.03"
PACKAGE="$PKG_NAME-$PKG_VER"
TARBALL="$PACKAGE.tar.gz"
URL="http://softlayer.dl.sourceforge.net/sourceforge/tesseract-ocr/$TARBALL"

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
