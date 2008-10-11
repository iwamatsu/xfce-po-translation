dnl $Id: acinclude.m4 24773 2007-01-28 10:37:43Z benny $
dnl
dnl Copyright (c) 2004-2006
dnl         The Thunar development team. All rights reserved.
dnl
dnl Written for Thunar by Benedikt Meurer <benny@xfce.org>.
dnl



dnl # BM_THUNAR_PLUGIN_APR()
dnl #
dnl # Check whether the "Advanced Properties" plugin
dnl # should be built and installed.
dnl #
AC_DEFUN([BM_THUNAR_PLUGIN_APR],
[
AC_ARG_ENABLE([apr-plugin], [AC_HELP_STRING([--disable-apr-plugin], [Don't build the thunar-apr plugin, see plugins/thunar-apr/README])],
  [ac_bm_thunar_plugin_apr=$enableval], [ac_bm_thunar_plugin_apr=yes])
AC_MSG_CHECKING([whether to build the thunar-apr plugin])
AM_CONDITIONAL([THUNAR_PLUGIN_APR], [test x"$ac_bm_thunar_plugin_apr" = x"yes"])
AC_MSG_RESULT([$ac_bm_thunar_plugin_apr])

dnl Check for libexif (for the "Image" properties page)
XDT_CHECK_OPTIONAL_PACKAGE([EXIF], [libexif], [0.6.0], [exif], [Exif support])
])



dnl # BM_THUNAR_PLUGIN_SBR()
dnl #
dnl # Check whether the "Simple Builtin Renamers" plugin
dnl # should be built and installed.
dnl #
AC_DEFUN([BM_THUNAR_PLUGIN_SBR],
[
AC_ARG_ENABLE([sbr-plugin], AC_HELP_STRING([--disable-sbr-plugin], [Don't build the thunar-sbr plugin, see plugins/thunar-sbr/README]),
  [ac_bm_thunar_plugin_sbr=$enableval], [ac_bm_thunar_plugin_sbr=yes])
AC_MSG_CHECKING([whether to build the thunar-sbr plugin])
AM_CONDITIONAL([THUNAR_PLUGIN_SBR], [test x"$ac_bm_thunar_plugin_sbr" = x"yes"])
AC_MSG_RESULT([$ac_bm_thunar_plugin_sbr])

dnl Check for PCRE (for the "Search & Replace" renamer)
XDT_CHECK_OPTIONAL_PACKAGE([PCRE], [libpcre], [6.0], [pcre], [Regular expression support])
])



dnl # BM_THUNAR_PLUGIN_TPA()
dnl #
dnl # Check whether the "Trash Panel Applet" plugin should
dnl # be built and installed (this is actually a plugin
dnl # for the Xfce panel, not for Thunar).
dnl #
AC_DEFUN([BM_THUNAR_PLUGIN_TPA],
[
AC_ARG_ENABLE([tpa-plugin], AC_HELP_STRING([--disable-tpa-plugin], [Don't build the thunar-tpa plugin, see plugins/thunar-tpa/README]),
  [ac_bm_thunar_plugin_tpa=$enableval], [ac_bm_thunar_plugin_tpa=yes])
if test x"$ac_bm_thunar_plugin_tpa" = x"yes"; then
  XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.90],
  [
    dnl # Can only build thunar-tpa if D-BUS was found previously
    ac_bm_thunar_plugin_tpa=$DBUS_FOUND
  ],
  [
    dnl # Cannot build thunar-tpa if xfce4-panel is not installed
    ac_bm_thunar_plugin_tpa=no
  ])
else
  ac_bm_thunar_plugin_tpa=no
fi
AC_MSG_CHECKING([whether to build the thunar-tpa plugin])
AM_CONDITIONAL([THUNAR_PLUGIN_TPA], [test x"$ac_bm_thunar_plugin_tpa" = x"yes"])
AC_MSG_RESULT([$ac_bm_thunar_plugin_tpa])
])



dnl # BM_THUNAR_PLUGIN_UCA()
dnl #
dnl # Check whether the "User Customizable Actions" plugin
dnl # should be built and installed.
dnl #
AC_DEFUN([BM_THUNAR_PLUGIN_UCA],
[
AC_ARG_ENABLE([uca-plugin], AC_HELP_STRING([--disable-uca-plugin], [Don't build the thunar-uca plugin, see plugins/thunar-uca/README]),
  [ac_bm_thunar_plugin_uca=$enableval], [ac_bm_thunar_plugin_uca=yes])
AC_MSG_CHECKING([whether to build the thunar-uca plugin])
AM_CONDITIONAL([THUNAR_PLUGIN_UCA], [test x"$ac_bm_thunar_plugin_uca" = x"yes"])
AC_MSG_RESULT([$ac_bm_thunar_plugin_uca])
])



dnl # BM_THUNAR_VFS_MONITOR_IMPL()
dnl #
dnl # Determine the file system monitoring to use for
dnl # thunar-vfs.
dnl #
dnl # Sets LIBFAM_CFLAGS and LIBFAM_LIBS and defines
dnl # HAVE_FAM_H and HAVE_LIBFAM if FAM/Gamin were
dnl # found.
dnl #
dnl # Sets $ac_bm_thunar_vfs_monitor_impl to "FAM",
dnl # "Gamin" or "none".
dnl #
AC_DEFUN([BM_THUNAR_VFS_MONITOR_IMPL],
[
LIBFAM_CFLAGS=""
LIBFAM_LIBS=""
have_libfam=no
ac_bm_thunar_vfs_monitor_impl="none"
XDT_CHECK_PACKAGE([LIBFAM], [gamin], [0.1.0],
[
  have_libfam=yes
  ac_bm_thunar_vfs_monitor_impl="Gamin"
],
[
  dnl Fallback to a generic FAM check
  AC_CHECK_HEADERS([fam.h],
  [
    AC_CHECK_LIB([fam], [FAMOpen],
    [
      have_libfam="yes" LIBFAM_LIBS="-lfam"
      ac_bm_thunar_vfs_monitor_impl="FAM"
    ])
  ])
])
if test x"$have_libfam" = x"yes"; then
  dnl Define appropriate symbols
  AC_DEFINE([HAVE_FAM_H], [1], [Define to 1 if you have the <fam.h> header file.])
  AC_DEFINE([HAVE_LIBFAM], [1], [Define to 1 if the File Alteration Monitor is available.])

  dnl Check for FAMNoExists (currently Gamin only)
  save_LIBS="$LIBS"
  LIBS="$LIBS $LIBFAM_LIBS"
  AC_CHECK_FUNCS([FAMNoExists])
  LIBS="$save_LIBS"
fi
AC_SUBST([LIBFAM_CFLAGS])
AC_SUBST([LIBFAM_LIBS])
])



dnl # BM_THUNAR_VFS_OS_IMPL()
dnl #
dnl # Determine the operating system support to use
dnl # for thunar-vfs.
dnl #
dnl # Sets ac_bm_thunar_vfs_os_impl to "bsd" or "generic" and
dnl # defines the automake conditional THUNAR_VFS_OS_IMPL_BSD.
dnl #
AC_DEFUN([BM_THUNAR_VFS_OS_IMPL],
[
  dnl # Auto-detect target operating system support
  AC_MSG_CHECKING([for operating system support])
  case "$target_os" in
  dragonfly*|freebsd*|netbsd*|openbsd*|darwin*)
    dnl # The BSD Family is fully supported
    ac_bm_thunar_vfs_os_impl=bsd
    ;;

  *)
    dnl # Otherwise fallback to generic OS support
    ac_bm_thunar_vfs_os_impl=generic
  esac
  AC_MSG_RESULT([$ac_bm_thunar_vfs_os_impl])

  dnl # Set automake conditionals appropriately
  AM_CONDITIONAL([THUNAR_VFS_OS_IMPL_BSD], [test x"$ac_bm_thunar_vfs_os_impl" = x"bsd"])
])



dnl # BM_THUNAR_VFS_VOLUME_IMPL()
dnl #
dnl # Determines the volume manager implementation to
dnl # use for thunar-vfs.
dnl #
dnl # Sets ac_bm_thunar_vfs_volume_impl to "freebsd",
dnl # "hal" or "none".
dnl #
AC_DEFUN([BM_THUNAR_VFS_VOLUME_IMPL],
[
  dnl The --with-volume-manager option
  AC_ARG_WITH([volume-manager],
AC_HELP_STRING([--with-volume-manager=@<:@auto/freebsd/hal/none@:>@], [The volume manager implementation @<:@default=auto@:>@]),
    [], [with_volume_manager=auto])

  dnl # Check if we should try to auto-detect
  if test x"$with_volume_manager" = x"freebsd"; then
    ac_bm_thunar_vfs_volume_impl=freebsd
  elif test x"$with_volume_manager" = x"hal"; then
    ac_bm_thunar_vfs_volume_impl=hal
  elif test x"$with_volume_manager" = x"none"; then
    ac_bm_thunar_vfs_volume_impl=none
  else
    dnl # Check if HAL is available
    XDT_CHECK_PACKAGE([HAL], [hal-storage], [0.5.0],
    [
      dnl # HAL is available, use it
      ac_bm_thunar_vfs_volume_impl=hal
    ],
    [
      dnl # Check operating system type
      case "$target_os" in
      freebsd*)
        dnl # FreeBSD is fully supported
        ac_bm_thunar_vfs_volume_impl=freebsd
        ;;
      *)
        dnl # Otherwise no volume support
        ac_bm_thunar_vfs_volume_impl=none
        ;;
      esac
    ])
  fi

  dnl # We need HAL >= 0.5.x and D-BUS >= 0.23 for the HAL volume manager
  if test x"$ac_bm_thunar_vfs_volume_impl" = x"hal"; then
    XDT_CHECK_PACKAGE([EXO_HAL], [exo-hal-0.3], [0.3.1.13])
    XDT_CHECK_PACKAGE([HAL], [hal-storage], [0.5.0])
    XDT_CHECK_PACKAGE([HAL_DBUS], [dbus-glib-1], [0.23])
  fi

  dnl # Set config.h variables depending on what we're going to use
  AC_MSG_CHECKING([for the volume manager implemenation])
  case "$ac_bm_thunar_vfs_volume_impl" in
  freebsd)
    AC_DEFINE([THUNAR_VFS_VOLUME_IMPL_FREEBSD], [1], [Define to 1 if the FreeBSD volume manager implementation should be used])
    ;;

  hal)
    AC_DEFINE([THUNAR_VFS_VOLUME_IMPL_HAL], [1], [Define to 1 if the HAL volume manager implementation should be used])
    ;;

  *)
    AC_DEFINE([THUNAR_VFS_VOLUME_IMPL_NONE], [1], [Define to 1 if no volume manager implementation should be used])
    ;;
  esac
  AC_MSG_RESULT([$ac_bm_thunar_vfs_volume_impl])

  dnl # Set automake conditionals appropriately
  AM_CONDITIONAL([THUNAR_VFS_VOLUME_IMPL_FREEBSD], [test x"$ac_bm_thunar_vfs_volume_impl" = x"freebsd"])
  AM_CONDITIONAL([THUNAR_VFS_VOLUME_IMPL_HAL], [test x"$ac_bm_thunar_vfs_volume_impl" = x"hal"])
  AM_CONDITIONAL([THUNAR_VFS_VOLUME_IMPL_NONE], [test x"$ac_bm_thunar_vfs_volume_impl" = x"none"])
])
