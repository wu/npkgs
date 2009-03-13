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

if [ "$OS" = "Darwin" ]; then
  echo
  echo PATCHING FOR Darwin
  echo
  echo Patching pty.c
  $PATCHCMD pty.c < ../../files/patch-pty.c.diff
  echo
  echo DONE PATCHING
  echo
elif [ "$OS" = "SunOS" -a "$OSVER" = "5.11" ]; then
  echo
  echo PATCHING FOR OpenSolaris
  echo
  echo misc.c patch from: http://wiki.genunix.org/wiki/index.php/Screen
  perl -i.orig -lpe 's/$/ || defined(sun)/ if $. == 616' misc.c
  echo
  echo
  echo DONE PATCHING
  echo
fi

common_configure
common_make
common_install
common_install_links
