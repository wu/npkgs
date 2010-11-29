#!/bin/bash

PKG_NAME="lua"
PKG_VERSION="5.1.4"
PACKAGE="$PKG_NAME-$PKG_VERSION"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.lua.org/ftp/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE || exit 1

if [ $OS == "Darwin" ]
then
  common_make macosx
else
  echo "ERROR: build script not tested on this platform, add target"
  exit 1
fi

common_make test || exit 2

common_install INSTALL_TOP=$PKG_PREFIX || exit 3

common_install_links
