#!/bin/bash

# pipeviewier

PKG_NAME="pv"
PACKAGE="$PKG_NAME-1.1.4"
TARBALL="$PACKAGE.tar.gz"
URL="http://pipeviewer.googlecode.com/files/pv-1.1.4.tar.gz"

# source common envs
. ../../common.sh

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
