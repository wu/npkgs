#!/bin/bash

PKG_NAME="swig"
PACKAGE="$PKG_NAME-2.0.8"
TARBALL="$PACKAGE.tar.gz"
URL="http://downloads.sourceforge.net/project/swig/swig/$PACKAGE/$TARBALL"

#PREREQS="perl ruby python make"
PREREQS="perl make pcre"

# source common envs
. ../../common.sh

export CC=gcc
export MAKE=gmake

#CONFIGURE="$CONFIGURE --with-perl5=$PREFIX/bin/perl --with-ruby=$PREFIX/bin/ruby --with-python=$PREFIX/bin/python"
CONFIGURE="$CONFIGURE --with-perl5=$PREFIX/bin/perl"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                           || exit

common_configure
common_make
common_install
common_install_links

