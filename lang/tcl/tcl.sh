#!/bin/bash

PKG_NAME="tcl"
PACKAGE="${PKG_NAME}8.5.7"
TARBALL="$PACKAGE-src.tar.gz"
URL="http://superb-west.dl.sourceforge.net/sourceforge/tcl/$TARBALL"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --enable-threads"

common_fetch
common_prereqs
common_clean
common_untar

# build and install

cd $PACKAGE/unix                     || exit

if [ "$OS.$OSVER" = "SunOS.5.11" ]; then
  if [ -z "`isainfo | grep amd64`" ]; then
    echo
    echo "PATCHING configure for OpenSolaris 32-bit..."
    echo
    echo "from: http://sourceforge.net/tracker/index.php?func=detail&aid=1839067&group_id=10894&atid=110894"
    echo
    $PATCHCMD configure < ../../../files/SunOS.5.11.configure.patch || exit
    echo
    echo DONE
    echo
  fi
fi

common_configure
common_make
common_install

common_install_links

# create a symlink for version-specific 'tclsh'
rm $PREFIX/bin/tclsh
ln -s $PREFIX/bin/tclsh8.5 $PREFIX/bin/tclsh
