#!/bin/bash

PKG_NAME="vim"
PACKAGE="$PKG_NAME-7.3"
TARBALL="$PACKAGE.tar.bz2"
URL="http://ftp.vim.org/pub/vim/unix/$TARBALL"

export MAKE=gmake

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar_bzip

# build and install
cd vim73                             || exit

common_configure
common_make
common_install
common_install_links

