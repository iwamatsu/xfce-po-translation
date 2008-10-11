## Process this file with automake to produce Makefile.in

SUBDIRS = pixmaps libsqueeze po docs src icons data

wrapperdir = $(libexecdir)/thunar-archive-plugin
wrapper_SCRIPTS = squeeze.tap

desktopdir = $(datadir)/applications
desktop_in_files = squeeze.desktop.in
desktop_DATA = $(desktop_in_files:.desktop.in=.desktop)
@INTLTOOL_DESKTOP_RULE@

EXTRA_DIST = \
	intltool-extract.in \
	intltool-merge.in \
	intltool-update.in \
	squeeze.tap \
	gettext.h \
	$(desktop_in_files) \
	$(wrapper_DATA)

DISTCLEANFILES = \
	intltool-extract \
	intltool-merge \
	intltool-update \
	$(desktop_DATA)

DISTCHECK_CONFIGURE_FLAGS =						\
	--enable-gtk-doc

ACLOCAL_AMFLAGS = -I m4
