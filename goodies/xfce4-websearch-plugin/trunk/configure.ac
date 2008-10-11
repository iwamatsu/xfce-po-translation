dnl $Id$

m4_define([websearch_version_major], [0])
m4_define([websearch_version_minor], [2])
m4_define([websearch_version_micro], [0])
m4_define([websearch_version],
    [websearch_version_major.websearch_version_minor.websearch_version_micro])

AC_COPYRIGHT([Copyright (c) 2005 by Piotr Wolny <gildur@gmail.com>])
AC_INIT([xfce4-websearch-plugin], [websearch_version], [gildur@gmail.com])

AM_INIT_AUTOMAKE([AC_PACKAGE_TARNAME], [AC_PACKAGE_VERSION])
AM_CONFIG_HEADER([config.h])
AM_MAINTAINER_MODE

AC_AIX
AC_ISC_POSIX
AC_MINIX

AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_LIBTOOL
AC_PROG_INTLTOOL

AC_HEADER_STDC

XDT_I18N([ca cs de el en_GB eu fr hu ja pl pt_PT ru sq vi zh_TW])

XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.0])

XDT_FEATURE_DEBUG()

AC_OUTPUT([Makefile
           po/Makefile.in
           src/Makefile])
