#!/bin/bash

PKG_NAME="screen"
PACKAGE="$PKG_NAME-4.0.3"
TARBALL="$PACKAGE.tar.gz"
URL="http://ftp.gnu.org/pub/gnu/$PKG_NAME/$TARBALL"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --enable-colors256"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

if [ "`uname -o`" = "Darwin" ]; then
  $PATCHCMD pty.c < ../../files/patch-pty.c.diff
fi

common_configure
common_make
common_install
common_install_links
