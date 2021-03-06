#!/bin/bash

PKG_NAME="gdmap"
PKG_VERSION="0.8.1"
PACKAGE="$PKG_NAME-$PKG_VERSION"
TARBALL="$PACKAGE.tar.gz"
URL="http://downloads.sourceforge.net/project/gdmap/gdmap/$PKG_VERSION/$TARBALL"
PREREQS="perl libxml2 gtk+"

# source common envs
. ../../common.sh

if [ "$OS.$OSVER" = "SunOS.5.11" ]
then
    echo
    echo ADDING MATH LIB FOR sqrt
    echo
    export LIBS="-lm"
fi

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

if [ "$OS" = "Darwin" ]
then
    echo
    echo REMOVING INCLUDE FOR vfs.h
    echo
    perl -pi -e's|^\#include \<sys\/vfs\.h\>||' src/gui_main.c
fi

common_configure
common_make
common_install
common_install_links
