# $Id: Makefile.am 2365 2007-01-15 18:49:51Z nick $

SUBDIRS =								\
	panel-plugin							\
	po								\
	icons
	
distclean-local:
	rm -rf *.cache *~

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

EXTRA_DIST =								\
	intltool-extract.in						\
	intltool-merge.in						\
	intltool-update.in

DISTCLEANFILES =							\
	intltool-extract						\
	intltool-merge							\
	intltool-update

# vi:set ts=8 sw=8 noet ai nocindent syntax=automake:
