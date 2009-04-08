#!/bin/bash

PKG_NAME="nagios"
PACKAGE="$PKG_NAME-3.0.6"
TARBALL="$PACKAGE.tar.gz"
URL="http://superb-east.dl.sourceforge.net/sourceforge/nagios/$TARBALL"

# source common envs
. ../../common.sh

[ -z "$NAGIOS_USER" ] && echo "you must set NAGIOS_USER, probably in $NPKG_PATH/common/host/$HOST_SHORT.sh" && exit
[ -z "$NAGIOS_GROUP" ] && echo "you must set NAGIOS_GROUP, probably in $NPKG_PATH/common/host/$HOST_SHORT.sh" && exit

CONFIGURE="$CONFIGURE --with-nagios-user=$NAGIOS_USER --with-nagios-group=$NAGIOS_GROUP"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

common_configure

common_make all

common_install
common_install_links
