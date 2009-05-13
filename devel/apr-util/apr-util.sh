#!/bin/bash

PKG_NAME="apr-util"
PACKAGE="$PKG_NAME-1.3.4"
TARBALL="$PACKAGE.tar.gz"
URL="http://mirror.olnevhost.net/pub/apache/apr/$TARBALL"
PREREQS="apr-1 expat"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-apr=$PREFIX/root/apr-1 --with-expat=$PREFIX/root/expat"

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
