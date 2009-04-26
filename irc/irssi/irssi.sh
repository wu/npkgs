#!/bin/bash

PKG_NAME="irssi"
PACKAGE="$PKG_NAME-0.8.13"
TARBALL="$PACKAGE.tar.gz"
URL="http://irssi.org/files/$TARBALL"

PREREQS="pkg-config glib ncurses"

# todo: can't get this to compile with perl on OS X :/

# source common envs
. ../../common.sh

#CONFIGURE="$CONFIGURE --enable-shared=no --without-socks --without-bot --with-proxy --with-textui --disable-largefile --disable-ssl --with-perl-lib=site"
CONFIGURE="$CONFIGURE --with-perl=yes --without-socks --without-bot --with-proxy --with-textui --disable-largefile --disable-ssl --with-perl-lib=site"

# if this is opensolaris, force use of our own glib!
if [ "$OS.$OSVER" = "SunOS.5.11" ]
then
  export LD_LIBRARY_PATH="$PREFIX/root/glib/lib"
fi

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

if [ "$OS" = "Darwin" ]; then
    echo
    echo "Patching for OS X"
    echo "see: http://bugs.irssi.org/index.php?do=details&task_id=663"
    echo
    chmod u+w src/perl/perl-core.c
    $PATCHCMD src/perl/perl-core.c < ../../files/perl-core.patch || exit
fi

common_configure
common_make
common_install
common_install_links
