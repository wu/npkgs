#!/bin/bash

PKG_NAME="imlib2"
PACKAGE="$PKG_NAME-1.4.4"
TARBALL="$PACKAGE.tar.gz"
URL="http://voxel.dl.sourceforge.net/sourceforge/enlightenment/$TARBALL"
PREREQS="libpng jpeg"

# source common envs
. ../../common.sh

export CC=gcc

CONFIGURE="$CONFIGURE --with-jpeg=yes"
export LDFLAGS="-L$PREFIX/root/jpeg/lib $LDFLAGS"
export CPPFLAGS="-I$PREFIX/root/jpeg/include $CPPFLAGS"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

if [ "$OS" = "Darwin" ]
then
    echo
    echo "OS X: adding --enable-amd64=no to configure"
    CONFIGURE="$CONFIGURE --enable-amd64=no"

    echo
    echo "Applying loader_png.c patch from https://github.com/mxcl/homebrew/blob/master/Library/Formula/imlib2.rb"
    $PATCHCMD src/modules/loaders/loader_png.c < ../../files/loader_png.patch || exit
fi

common_configure
common_make
common_install
common_install_links
