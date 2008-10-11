#!/bin/sh
#
# $Id: autogen.sh 4312 2005-01-27 10:10:04Z jasper $
#
# Copyright (c) 2002-2005
#         The Xfce development team. All rights reserved.
#
# Written for Xfce by Benedikt Meurer <benny@xfce.org>.
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

linguas=`ls po/*.po | sed 's/po\/\([a-zA-Z_]*\).po/\1/' | tr '\n' ' '`
sed -e "s/@LINGUAS@/${linguas}/g" < "configure.ac.in" > "configure.ac"

exec xdt-autogen $@

# vi:set ts=2 sw=2 et ai:
