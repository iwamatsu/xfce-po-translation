# $Id: Makefile.am 24778 2007-01-28 19:03:47Z juha $

if INCLUDED_LIBICAL
LIBICAL_SUBDIR=								\
	libical
endif

SUBDIRS = 								\
	$(LIBICAL_SUBDIR)						\
	doc								\
	icons								\
	po								\
	sounds								\
	src								\
	panel-plugin							\
	globaltime							\
	plugin

desktopdir = $(datadir)/applications
desktop_in_files = xfcalendar.desktop.in
desktop_DATA = $(desktop_in_files:.desktop.in=.desktop)
@INTLTOOL_DESKTOP_RULE@

if HAVE_DBUS
servicedir = $(datadir)/dbus-1/services
service_in_files = org.xfce.calendar.service.in org.xfce.orage.service.in
service_DATA = $(service_in_files:.service.in=.service)
%.service: %.service.in
	sed -e "s,\@bindir\@,$(bindir),g" < $< > $@
endif

EXTRA_DIST =								\
	mkinstalldirs  							\
	intltool-extract.in						\
	intltool-merge.in						\
	intltool-update.in						\
	xfcalendar.spec							\
	$(desktop_in_files)						\
	$(service_in_files)

DISTCLEANFILES =							\
	intltool-extract						\
	intltool-merge							\
	intltool-update							\
	$(desktop_DATA)							\
	$(service_DATA)

AUTOMAKE_OPTIONS =							\
	1.8								\
	dist-bzip2

distclean-local:
	rm -rf *.cache *~ *.spec

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

html: Makefile
	make -C doc html

ACLOCAL_AMFLAGS = -I m4

# vi:set ts=8 sw=8 noet ai nocindent:
