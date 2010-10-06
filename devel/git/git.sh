#!/bin/bash

PKG_NAME="git"
PKG_VERSION="1.7.3.1"
PACKAGE="$PKG_NAME-$PKG_VERSION"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.kernel.org/pub/software/scm/git/$TARBALL"
PREREQS="openssl perl curl make expat tcl tk"

export CC=gcc
export MAKE=gmake

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-openssl=$PREFIX/root/openssl --with-tcltk=$PREFIX/bin/wish --with-perl=$PREFIX/root/perl/bin/perl --with-curl=$PREFIX/root/curl --with-expat=$PREFIX/root/expat"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

common_configure
common_make

# /usr/ucb/install does not exist on opensolaris
if [ "$OS" = "SunOS" -a ! -r "/usr/ucb/install" ]
then
    echo "Adjusting path for 'install' script, /usr/ucb/install does not exist!"
    perl -pi -e's|/usr/ucb/install|install|g' Makefile
    echo "DONE"
fi

common_install

common_install_links
