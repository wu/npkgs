#!/bin/bash

PKG_NAME="nagios"
PACKAGE="$PKG_NAME-3.4.4"
TARBALL="$PACKAGE.tar.gz"
URL="http://prdownloads.sourceforge.net/sourceforge/$PKG_NAME/$TARBALL"
PREREQS="make"

# source common envs
. ../../common.sh

# required vars
[ -z "$NAGIOS_USER" ] && echo "you must set NAGIOS_USER, probably in $NPKG_PATH/common/host/$HOST_SHORT.sh" && exit
[ -z "$NAGIOS_GROUP" ] && echo "you must set NAGIOS_GROUP, probably in $NPKG_PATH/common/host/$HOST_SHORT.sh" && exit

export CC=gcc
export MAKE=gmake

CONFIGURE="$CONFIGURE --with-nagios-user=$NAGIOS_USER --with-nagios-group=$NAGIOS_GROUP --enable-nanosleep"

if [ "$OS" = "SunOS" ]
then
  export LIBS="-lsocket $LIBS"
fi

common_fetch
common_prereqs
common_clean
common_untar

# build and install
#cd $PACKAGE                          || exit
cd nagios                          || exit

common_configure

common_make all

common_install
common_install_links
