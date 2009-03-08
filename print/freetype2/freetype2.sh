#!/bin/bash

PKG_NAME="freetype2"
PACKAGE="freetype-2.3.7"
TARBALL="$PACKAGE.tar.gz"
URL="http://download.savannah.gnu.org/releases/freetype/$TARBALL"

MAKE=gmake
CC=gcc

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
