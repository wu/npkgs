#!/bin/bash

PKG_NAME="apg"
PACKAGE="$PKG_NAME-2.2.3"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.adel.nursat.kz/apg/download/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

perl -pi -e"s|/usr/local|$PKG_PREFIX|" Makefile
perl -pi -e"s|\-lcrypt||" Makefile

common_make standalone

mkdir $PKG_PREFIX
mkdir $PKG_PREFIX/bin

cp apg $PKG_PREFIX/bin/

common_install
common_install_links
