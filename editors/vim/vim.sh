#!/bin/bash

PKG_NAME="vim"
PACKAGE="$PKG_NAME-7.2"
TARBALL="$PACKAGE.tar.bz2"
URL="http://ftp.vim.org/pub/vim/unix/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar_bzip

# build and install
cd vim72                             || exit

common_configure
common_make
common_install
common_install_links

