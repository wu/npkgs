#!/bin/bash

PKG_NAME="rsync"
PACKAGE="$PKG_NAME-3.0.6"
TARBALL="$PACKAGE.tar.gz"
URL="http://samba.anu.edu.au/ftp/rsync/src/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_fetch
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

common_configure
common_make
common_install
common_install_links
