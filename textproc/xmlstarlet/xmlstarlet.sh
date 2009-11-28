#!/bin/bash

PKG_NAME="xmlstarlet"
PKG_VERSION="1.0.1"
PACKAGE="$PKG_NAME-$PKG_VERSION"
TARBALL="$PACKAGE.tar.gz"
URL="http://downloads.sourceforge.net/project/xmlstar/$PKG_NAME/$PKG_VERSION/$TARBALL"
PREREQS="libxml2 libxslt libgcrypt"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-libxml-prefix=$PREFIX --with-libxslt-prefix=$PREFIX"
export CC=gcc

if [ "$OS.$OSVER" = "SunOS.5.11" ]
then
    # extra libs for solairs
    export LIBS="$LIBS -lsocket -liconv -lnsl -lgcrypt -lgpg-error"
fi



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

