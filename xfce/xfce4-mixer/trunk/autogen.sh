#!/bin/sh
#
# $Id: autogen.sh 27902 2008-09-17 22:52:26Z jannis $
#
# vi:set ts=2 sw=2 et ai:
#
# Copyright (c) 2008 Jannis Pohlmann <jannis@xfce.org>
#

# Check if xdt-autogen is installed
(type xdt-autogen) >/dev/null 2>&1 || {
  cat >&2 <<EOF
autogen.sh: You don't seem to have the Xfce development tools installed on
            your system, which are required to build this software.
            Please install the xfce4-dev-tools package first, it is available
            from http://www.xfce.org/.
EOF
  exit 1
}

# Verify that po/LINGUAS is present
(test -f po/LINGUAS) >/dev/null 2>&1 || {
  cat >&2 <<EOF
autogen.sh: The file po/LINGUAS could not be found. Please check your snapshot
            or try to checkout again.
EOF
  exit 1
}

# Substitute revision and linguas
linguas=`sed -e '/^#/d' po/LINGUAS`
if test -d .git/svn; then
  revision=`git svn find-rev trunk 2>/dev/null ||
            git svn find-rev origin/trunk 2>/dev/null ||
            git svn find-rev HEAD 2>/dev/null ||
            git svn find-rev master 2>/dev/null`
elif test -f .svn; then
  revision=`LC_ALL=C svn info $0 | awk '/^Revision: / {printf "%05d\n", $2}'`
else
  revision=""
fi
sed -e "s/@LINGUAS@/${linguas}/g" \
    -e "s/@REVISION@/${revision}/g" \
    < "configure.in.in" > "configure.in"

exec xdt-autogen $@

# xdt-autogen clean does not remove all generated files
(test x"clean" = x"$1") && {
  rm -rf configure.in
} || true
