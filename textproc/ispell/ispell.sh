#!/bin/bash

PKG_NAME="ispell"
PACKAGE="$PKG_NAME-3.3.02"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.lasr.cs.ucla.edu/geoff/tars/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

# determine the OS-specific local.h file and use that
MYOS=`uname -o`
if [ "$MYOS" = "Darwin" ]; then
  cp local.h.macos local.h || exit
elif [ "$MYOS" = "Solaris" ]; then
  cp local.h.solaris local.h || exit
else
  echo "ERROR: could not determine os-specific local.h file, see README"
  exit 1;
fi

# fix the installation paths, by default it will just install directly
# into /usr/local.
perl -pi -e"s|/usr/local|$PKG_PREFIX|g" local.h || exit

# create the lib directory in the $PKG_PREFIX, the ispell script just
# expects this to already exist and dies if it doesn't
mkdir -p $PKG_PREFIX/lib || exit


common_make
common_install
common_install_links
