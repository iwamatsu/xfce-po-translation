dnl configure.ac
dnl
dnl xfce4-cpufreq-plugin - Plugin shows Infos about Frequency and Governour of
dnl                         CPUs
dnl

dnl Version information
m4_define([xfce4_cpufreq_plugin_version], [0.2])

dnl Initialize autoconf
AC_COPYRIGHT([Copyright (c) 2006 Thomas Schreck <shrek@xfce.org>])
AC_INIT([xfce4-cpufreq-plugin], [xfce4_cpufreq_plugin_version()],
	[shrek@xfce.org])

dnl Initialize automake
AM_INIT_AUTOMAKE([AC_PACKAGE_TARNAME()], [AC_PACKAGE_VERSION()])
AM_CONFIG_HEADER([config.h])
AM_MAINTAINER_MODE()

dnl Check for basic programs
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_LIBTOOL
AC_PROG_INTLTOOL()

dnl Check for i18n support
XDT_I18N([ca cs en_GB eu fr it nb_NO pl pt_PT sq uk])

dnl configure the panel plugin
XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.6.0])
XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.6.0])
XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.3.90])
XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.90])
XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.90])

AC_OUTPUT([
Makefile
panel-plugin/Makefile
icons/Makefile
icons/16x16/Makefile
icons/22x22/Makefile
icons/48x48/Makefile
icons/scalable/Makefile
po/Makefile.in
])
