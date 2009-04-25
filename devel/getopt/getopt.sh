#!/bin/bash

PKG_NAME="getopt"
PACKAGE="$PKG_NAME-1.1.4"
TARBALL="$PACKAGE.tar.gz"
URL="http://software.frodo.looijaard.name/getopt/files/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit


if [ "$OS" = "Darwin" ]; then
  echo
  echo "fixing LDFLAGS argument on OS X"
  $PERL -pi -e's|LDFLAGS=|LDFLAGS=-lintl |' Makefile || exit
  echo "DONE"
  echo
fi

common_make
common_install prefix=$PKG_PREFIX
common_install_links
