# $Id: Makefile.am 25266 2007-03-23 11:11:47Z jannis $
#
# vi:set ts=8 sw=8 noet ai nocindent:

SUBDIRS =								\
	tdb								\
	libxfce4menu							\
	docs								\
	tests								\
	po

AUTOMAKE_OPTIONS =							\
	1.8								\
	dist-bzip2

distclean-local:
	rm -rf *.spec *.cache *~

EXTRA_DIST =								\
	AUTHORS								\
	COPYING								\
	ChangeLog							\
	HACKING								\
	INSTALL								\
	NEWS								\
	README								\
	THANKS								\
	TODO								\
	STATUS								\
	intltool-extract.in						\
	intltool-merge.in						\
	intltool-update.in

DISTCLEANFILES =							\
	libxfce4menu.spec						\
	intltool-extract						\
	intltool-merge							\
	intltool-update

DISTCHECK_CONFIGURE_FLAGS =						\
	--enable-gtk-doc
