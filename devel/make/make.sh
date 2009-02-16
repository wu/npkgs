#!/bin/bash

PKG_NAME="make"
PACKAGE="$PKG_NAME-3.81"
TARBALL="$PACKAGE.tar.gz"
URL="http://ftp.gnu.org/gnu/make/$TARBALL"

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

if [ ! -r $PREFIX/bin/gmake ]; then
  echo
  echo LINKING $PREFIX/bin/make TO $PREFIX/bin/gmake
  ln -s $PREFIX/bin/make $PREFIX/bin/gmake
fi

