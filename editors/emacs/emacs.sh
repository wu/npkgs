#!/bin/bash

PKG_NAME="emacs"
PACKAGE="$PKG_NAME-24.1"
TARBALL="$PACKAGE.tar.gz"
URL="http://ftp.gnu.org/pub/gnu/emacs/$TARBALL"
PREREQS="libpng libungif jpeg tiff"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

if [ "$OS" = "Darwin" ]; then
    #echo
    #echo "Patching for OS X"
    #echo "https://github.com/mxcl/homebrew/issues/4650"
    #echo
    #$PATCHCMD src/unexmacosx.c < ../../files/unexmacosx.c.patch || exit

    CONFIGURE="$CONFIGURE --with-ns"
else

    CONFIGURE="$CONFIGURE --with-x"
fi

common_configure
common_make
common_install
common_install_links

