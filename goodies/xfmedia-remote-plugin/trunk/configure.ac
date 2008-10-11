dnl configure.ac
dnl
dnl xfmedia-remote-plugin - Xfce4 panel plugin for Xfmedia remote control
dnl 

AC_INIT([xfmedia-remote-plugin], [0.2.2], [pasi.ov@gmail.com])
AC_PREREQ([2.5.0])
AM_INIT_AUTOMAKE()
AM_CONFIG_HEADER([config.h])
AM_MAINTAINER_MODE

AC_AIX
AC_ISC_POSIX
AC_MINIX

AC_PROG_CC
AC_PROG_LIBTOOL
AC_PROG_INSTALL
AC_PROG_INTLTOOL([0.31], [no-xml])

AC_HEADER_STDC
AC_CHECK_HEADERS(string.h)

XDT_I18N([fi])

XDT_CHECK_LIBX11_REQUIRE

XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.4.0])
XDT_CHECK_PACKAGE([GOBJECT], [gobject-2.0], [2.4.0])
XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.4.0])
XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.2.0])
XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.2.0])

dnl For now we just fetch the CFLAGS (for includes)
XDT_CHECK_OPTIONAL_PACKAGE([XFMEDIA], [xfmedia-plugin], [0.10.0])
if test "x$XFMEDIA_FOUND" != "xyes"; then
    XDT_CHECK_PACKAGE([XFMEDIA], [xfmedia-plugin], [0.9.0])
    AC_DEFINE([XFMEDIA_TOO_OLD], [1], [Old xfmedia])
fi

XDT_CHECK_OPTIONAL_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.22])
if test "x$LIBXFCE4PANEL_FOUND" != "xyes"; then
    XDT_XFCE_PANEL_PLUGIN([XFCE4_PANEL], [4.2.0])
    AC_DEFINE([HAVE_OLD_PANEL], [1], [Use old panel api])
fi
AM_CONDITIONAL([BUILD_OLD_PANEL_PLUGIN], [test "x$LIBXFCE4PANEL_FOUND" != "xyes"])

dnl check for dbus
XDT_CHECK_OPTIONAL_PACKAGE([DBUS], [dbus-glib-1], [0.31], [dbus],
                           [D-BUS (new api)], [yes])
dnl AM_CONDITIONAL([BUILD_WITH_OLD_DBUS], [test "x$DBUS_FOUND" != "xyes"])
if test "x$DBUS_FOUND" != "xyes"; then
    XDT_CHECK_PACKAGE([DBUS], [dbus-glib-1], [0.22])
    AC_DEFINE([DBUS_USE_OLD_API], [1], [Use old D-BUS api])
fi

BM_DEBUG_SUPPORT

AC_OUTPUT([
Makefile
panel-plugin/Makefile
po/Makefile.in
])

