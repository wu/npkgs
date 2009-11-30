#!/bin/bash

PKG_NAME="pango"
PKG_VERSION="1.26"
PACKAGE="$PKG_NAME-$PKG_VERSION.1"
TARBALL="$PACKAGE.tar.bz2"
URL="http://ftp.gnome.org/pub/gnome/sources/pango/$PKG_VERSION/$TARBALL"
PREREQS="cairo automake autoconf"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar_bzip

# build and install
cd $PACKAGE                          || exit

if [ "$OS.$OSVER" = "SunOS.5.11" ]
then
    echo
    echo PATCHING FOR OPENSOLARIS
    echo SEE: http://src.opensolaris.org/source/xref/jds/spec-files/trunk/patches/pango-04-sunstudio.diff
    echo
    $PATCHCMD --strip 1 < ../../files/pango-04-sunstudio.diff || exit
    echo
    echo DONE PATCHING...
    echo
fi

common_configure
common_make
common_install

common_install_links
