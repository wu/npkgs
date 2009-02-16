#!/bin/bash

PKG_NAME="swig"
PACKAGE="$PKG_NAME-1.3.31"
TARBALL="$PACKAGE.tar.gz"
URL="http://easynews.dl.sourceforge.net/sourceforge/swig/$TARBALL"

#PREREQS="perl ruby python make"
PREREQS="perl make"

#export CC=gcc
export MAKE=gmake

# source common envs
. ../../common.sh

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

