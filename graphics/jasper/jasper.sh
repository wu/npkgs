#!/bin/bash

PKG_NAME="jasper"
PACKAGE="$PKG_NAME-1.900.1"
TARBALL="$PACKAGE.zip"
URL="http://www.ece.uvic.ca/~mdadams/jasper/software/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_unzip

# build and install
cd $PACKAGE                          || exit

common_configure
common_make
common_install
common_install_links
