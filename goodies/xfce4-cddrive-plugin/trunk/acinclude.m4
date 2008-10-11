dnl $Id$
dnl
dnl Additionnal m4 macros for xfce4-cddrive-plugin configure.in.in file.
dnl
dnl Copyright (c) 2007
dnl         The Xfce development team. All rights reserved.
dnl
dnl This program is free software; you can redistribute it and/or modify it
dnl under the terms of the GNU General Public License as published by the Free
dnl Software Foundation; either version 2 of the License, or (at your option)
dnl any later version.
dnl
dnl This program is distributed in the hope that it will be useful, but WITHOUT
dnl ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
dnl FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
dnl more details.
dnl
dnl You should have received a copy of the GNU General Public License along with
dnl this program; if not, write to the Free Software Foundation, Inc., 59 Temple
dnl Place, Suite 330, Boston, MA  02111-1307  USA

dnl SYL_DEBUG_SUPPORT()
dnl
dnl Modified BM_DEBUG_SUPPORT so that assertions are disabled when building
dnl final version (with --enable-final configure switch), as their purpose
dnl is debug only.
AC_DEFUN([SYL_DEBUG_SUPPORT],
[
  AC_ARG_ENABLE([final], AC_HELP_STRING([--enable-final], [Build optimized final version]),
      [enable_final=yes], [])
  AC_MSG_CHECKING([whether to build final version])
  if test x"$enable_final" = x"yes"; then
    AC_MSG_RESULT([yes])
    CPPFLAGS="$CPPFLAGS -DG_DISABLE_CHECKS -DG_DISABLE_ASSERT"
    CPPFLAGS="$CPPFLAGS -DG_DISABLE_CAST_CHECKS"
    if test x"$LD" = x""; then
      AC_PROG_LD()
    fi
    AC_MSG_CHECKING([whether $LD accepts -O1])
    case `$LD -O1 -v 2>&1 </dev/null` in
      *GNU* | *'with BFD'*)
        LDFLAGS="$LDFLAGS -Wl,-O1"
        AC_MSG_RESULT([yes])
      ;;
      *)
        AC_MSG_RESULT([no])
      ;;
    esac
  else
    AC_MSG_RESULT([no])
  fi
])
