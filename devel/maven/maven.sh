#!/bin/bash

PKG_NAME="apache-maven"
PACKAGE="$PKG_NAME-2.1.0"
TARBALL="$PACKAGE-bin.tar.gz"
URL="http://mirror.sourceshare.org/apache/maven/binaries/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
mv $PACKAGE $PREFIX/root || exit

common_install_links
