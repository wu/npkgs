#!/bin/bash

PKG_NAME="feh"
PACKAGE="$PKG_NAME-1.3.4"
TARBALL="$PACKAGE.tar.gz"
URL="http://linuxbrit.co.uk/downloads/$TARBALL"
PREREQS="imlib2 giblib"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-imlib2-prefix=$PREFIX/root/imlib2 --with-giblib=$PREFIX/root/giblib"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

common_configure

if [ $OS = "SunOS" ]
then
    perl -pi -e's|feh_LDADD \= |feh_LDADD = -lsocket -lnsl |g' src/Makefile
fi

common_make
common_install
common_install_links

