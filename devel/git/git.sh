#!/bin/bash

PKG_NAME="git"
PACKAGE="$PKG_NAME-1.6.1.3"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.kernel.org/pub/software/scm/git/$TARBALL"
PREREQS="openssl perl curl make"

export CC=gcc
export MAKE=gmake

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-openssl=$PREFIX --without-tcltk --with-perl=$PREFIX/bin/perl --with-curl --with-expat"

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

