#!/bin/bash

PKG_NAME="git-manpages"
PKG_VERSION="1.6.5.1"
PACKAGE="$PKG_NAME-$PKG_VERSION"
TARBALL="$PACKAGE.tar.gz"
URL="wget http://www.kernel.org/pub/software/scm/git/$TARBALL"
PREREQS="git"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

echo
echo Creating install directory: $PKG_PREFIX/man
mkdir -p $PKG_PREFIX/man

echo
echo Installing files into $PKG_PREFIX/man
mv * $PKG_PREFIX/man

echo
echo Creating symlinks
common_install_links
