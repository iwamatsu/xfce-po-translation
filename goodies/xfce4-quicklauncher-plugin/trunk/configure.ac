dnl
dnl 	configure.ac
dnl	quicklauncher plugin
dnl	2005 Masse Nicolas (masse_nicolas@yahoo.fr)
dnl

dnl version info
m4_define([xfce4_quicklauncher_version],[1.9.4])

dnl init autoconf
AC_INIT([xfce4-quicklauncher-plugin], [xfce4_quicklauncher_version], [masse_nicolas@yahoo.fr])
AC_CONFIG_SRCDIR([configure])

dnl init automake
AM_INIT_AUTOMAKE([xfce4-quicklauncher-plugin], [xfce4_quicklauncher_version()])
AM_CONFIG_HEADER([config.h])
AM_MAINTAINER_MODE

dnl Check for UNIX variants
AC_AIX
AC_ISC_POSIX
AC_MINIX
AM_CONDITIONAL([HAVE_CYGWIN], [test "`uname | grep \"CYGWIN\"`" != ""])

dnl disable static lib
AC_DISABLE_STATIC

dnl Check for basic programs
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_INTLTOOL()
AC_PROG_LIBTOOL

dnl configure the panel plugin
XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.20])
XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.20])

dnl Check for debugging support
XDT_FEATURE_DEBUG()

dnl For internationalisation
XDT_I18N([ca cs el en_GB eu fr gl hu ja pl pt_PT ru sq vi])

AC_OUTPUT([
panel-plugin/Makefile
po/Makefile.in
Makefile
])
