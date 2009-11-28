#!/bin/bash

PKG_NAME="libxslt"
PACKAGE="$PKG_NAME-1.1.26"
TARBALL="$PACKAGE.tar.gz"
URL="ftp://xmlsoft.org/libxslt/$TARBALL"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-libxml-prefix=$PREFIX"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

if [ "$OS.$OSVER" = "SunOS.5.11" ]
then
    perl -pi -e's|VERSION_SCRIPT_FLAGS\=\"\-Wl,\-M \-Wl,\"|#VERSION_SCRIPT_FLAGS=""|' configure
fi

common_configure
common_make
common_install
common_install_links
