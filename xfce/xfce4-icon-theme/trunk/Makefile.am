# $Id: Makefile.am 20986 2006-04-16 10:08:05Z benny $

SUBDIRS =								\
	Rodent								\
	mime								\
	po

AUTOMAKE_OPTIONS =							\
	1.8								\
	dist-bzip2

distclean-local:
	rm -rf xfce4-icon-theme.spec *.cache *~

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(datadir)/icons
	( cd $(DESTDIR)$(datadir)/icons; \
	  rm -f Rodent-svg; \
	)

EXTRA_DIST =								\
	AUTHORS								\
	COPYING								\
	ChangeLog							\
	INSTALL								\
	NEWS								\
	README								\
	TODO								\
	intltool-extract.in						\
	intltool-merge.in						\
	intltool-update.in

DISTCLEANFILES =							\
	intltool-extract						\
	intltool-merge							\
	intltool-update							\
	xfce4-icon-theme.spec

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = xfce4-icon-theme-1.0.pc

# vi:set ts=8 sw=8 noet ai nocindent:
