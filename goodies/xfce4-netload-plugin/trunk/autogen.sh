#!/bin/sh
#
# $Id: autogen.sh 2534 2007-03-02 21:16:33Z pollux $
#
# Copyright (c) 2002-2005
#         The Thunar development team. All rights reserved.
#
# Written for Thunar by Benedikt Meurer <benny@xfce.org>.
#

(type xdt-autogen) >/dev/null 2>&1 || {
  cat >&2 <<EOF
autogen.sh: You don't seem to have the Xfce development tools installed on
            your system, which are required to build this software.
            Please install the xfce4-dev-tools package first, it is available
            from http://www.xfce.org/.
EOF
  exit 1
}

linguas=`sed -e '/^#/d' po/LINGUAS`
revision=`LC_ALL=C svn info $0 | awk '/^Revision: / {printf "%05d\n", $2}'`
sed -e "s/@LINGUAS@/${linguas}/g" \
    -e "s/@REVISION@/${revision}/g" \
        < "configure.in.in" > "configure.in"

exec xdt-autogen $@

# vi:set ts=2 sw=2 et ai:
