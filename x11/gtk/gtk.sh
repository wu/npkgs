#!/bin/bash

PKG_NAME="gtk+"
PKG_VERSION="2.18"
PACKAGE="$PKG_NAME-$PKG_VERSION.3"
TARBALL="$PACKAGE.tar.bz2"
URL="http://ftp.gnome.org/pub/gnome/sources/$PKG_NAME/$PKG_VERSION/$TARBALL"
PREREQS="pango atk cairo jasper fontconfig"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar_bzip

# build and install
cd $PACKAGE                          || exit

for path in include/glib-2.0 \
            lib/glib-2.0/include \
            include/pango-1.0 \
            include/cairo \
            include/atk-1.0 \
            include/freetype2
do
    export CPPFLAGS="-I$PREFIX/$path $CPPFLAGS"
    export CFLAGS="-I$PREFIX/$path $CFLAGS"
    export CXXFLAGS="-I$PREFIX/$path $CXXFLAGS"
done

#echo CPPFLAGS=$CPPFLAGS

common_configure --disable-glibtest
common_make
common_install
common_install_links
