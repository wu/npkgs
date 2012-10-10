#!/bin/bash

PKG_NAME="tk"
PACKAGE="${PKG_NAME}8.5.12"
TARBALL="$PACKAGE-src.tar.gz"
URL="http://prdownloads.sourceforge.net/tcl/$TARBALL"
PREREQS="tcl"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-tcl=$PREFIX/root/tcl/lib --enable-threads --enable-64bit"

common_fetch
common_prereqs
common_clean
common_untar

# build and install

cd $PACKAGE/unix                     || exit
common_configure
common_make
common_install

common_install_links

# create a symlink for version-specific 'wish'
rm $PREFIX/bin/wish
ln -s $PREFIX/bin/wish8.5 $PREFIX/bin/wish
