# $Id: Makefile.am 1837 2006-08-02 21:11:40Z jannis $

@SET_MAKE@

SUBDIRS =								\
	panel-plugin							\
	scripts								\
	po

AUTOMAKE_OPTIONS =							\
	dist-bzip2

distclean-local:
	rm -rf *.spec *.cache *~

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

EXTRA_DIST =								\
	README								\
	THANKS								\
	AUTHORS								\
	COPYING								\
	NEWS								\
	intltool-extract.in						\
	intltool-merge.in						\
	intltool-update.in

DISTCLEANFILES =							\
	intltool-extract						\
	intltool-merge							\
	intltool-update
