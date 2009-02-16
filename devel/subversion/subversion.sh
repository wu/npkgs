#!/bin/bash

PKG_NAME="subversion"
PACKAGE="$PKG_NAME-1.5.5"
TARBALL="$PACKAGE.tar.bz2"
URL="http://subversion.tigris.org/downloads/$TARBALL"
PREREQS="swig apr-1 apr-util neon libiconv apache"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --disable-berkeley-db PERL=$PERL --with-apxs=$PREFIX/bin/apxs --with-neon=$PREFIX --with-swig=$PREFIX --with-apr=$PREFIX --with-apr-util=$PREFIX --without-sasl --with-ssl=$PREFIX"

common_fetch
common_prereqs
common_clean
common_untar_bzip

# build and install
cd $PACKAGE                           || exit

common_configure
common_make
common_install

echo
echo INSTALLING PERL BINDINGS
echo
make swig-pl || exit
make check-swig-pl || exit
make install-swig-pl || exit

echo
echo
common_install_links

