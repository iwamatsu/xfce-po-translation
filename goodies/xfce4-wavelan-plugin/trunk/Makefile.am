# $Id: Makefile.am 694 2005-07-11 14:18:53Z benny $

SUBDIRS =								\
	panel-plugin							\
	po

AUTOMAKE_OPTIONS =							\
	1.8								\
	dist-bzip2

distclean-local:
	rm -rf *.cache *~

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

EXTRA_DIST =								\
	AUTHORS								\
	ChangeLog							\
	COPYING								\
	NEWS								\
	README							\
	intltool-extract.in	\
	intltool-merge.in	\
	intltool-update.in

DISTCLEANFILES = 				\
	intltool-extract	\
	intltool-merge	\
	intltool-update

# vi:set ts=8 sw=8 noet ai nocindent:
