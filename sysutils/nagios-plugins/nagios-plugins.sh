#!/bin/bash

PKG_NAME="nagios-plugins"
PACKAGE="$PKG_NAME-1.4.14"
TARBALL="$PACKAGE.tar.gz"
URL="http://prdownloads.sourceforge.net/sourceforge/nagiosplug/$TARBALL"
PREREQS="openssl nagios"

# source common envs
. ../../common.sh

# required vars
[ -z "$NAGIOS_USER" ] && echo "you must set NAGIOS_USER, probably in $NPKG_PATH/common/host/$HOST_SHORT.sh" && exit
[ -z "$NAGIOS_GROUP" ] && echo "you must set NAGIOS_GROUP, probably in $NPKG_PATH/common/host/$HOST_SHORT.sh" && exit

CONFIGURE="$CONFIGURE --with-nagios-user=$NAGIOS_USER        \
                      --with-nagios-group=$NAGIOS_GROUP      \
                      --with-openssl=$NPKG_PATH/root/openssl \
                      --without-ipv6                         \
                      "

if [ "$OS" = "SunOS" ]
then
  export LIBS="-lsocket $LIBS"
fi

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                        || exit

common_configure
common_make all
common_install
