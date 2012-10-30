#!/bin/bash

PKG_NAME="coreutils"
PACKAGE="$PKG_NAME-8.19"
TARBALL="$PACKAGE.tar.xz"
URL="http://ftp.gnu.org/pub/gnu/coreutils/$TARBALL"
PREREQ="patch xz"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-libiconv-prefix=$PREFIX/root/libiconv"
export CC=gcc

common_fetch
common_prereqs
common_clean
common_untar_xz

# build and install
cd $PACKAGE                          || exit

# move APR's include file out of the way or it causes coreutils build to fail
if [ "$OS" = "Darwin" -a -r $NPKG_PREFIX/include/ap_config_auto.h ]
then
    echo
    echo "BACKING UP: $NPKG_PREFIX/include/ap_config_auto.h"
    mv $NPKG_PREFIX/include/ap_config_auto.h $NPKG_PREFIX/include/ap_config_auto.h.orig
fi

common_configure

common_make
common_install
common_install_links

# restore APR's include file after coreutil build/install is complete
if [ -r $NPKG_PREFIX/include/ap_config_auto.h.orig ]
then
    echo
    echo "RESTORING: $NPKG_PREFIX/include/ap_config_auto.h"
    mv $NPKG_PREFIX/include/ap_config_auto.h.orig $NPKG_PREFIX/include/ap_config_auto.h
fi
