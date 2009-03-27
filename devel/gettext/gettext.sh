#!/bin/bash

PKG_NAME="gettext"
PACKAGE="$PKG_NAME-0.17"
TARBALL="$PACKAGE.tar.gz"
URL="http://ftp.gnu.org/pub/gnu/$PKG_NAME/$TARBALL"
PREREQS="m4"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

if [ "$OS.$OSVER" = "SunOS.5.11" ]
then
  echo
  echo PATCHING for opensolaris acl_* functions
  echo
  $PERL -pi -e's|^LDFLAGS = |LDFLAGS = -lsec |g' gettext-tools/*/Makefile* || exit 1
fi

common_configure
common_make
common_install
common_install_links
