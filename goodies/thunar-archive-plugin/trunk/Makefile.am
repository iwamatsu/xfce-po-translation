# $Id: Makefile.am 2032 2006-09-13 18:06:36Z benny $

SUBDIRS =								\
	icons								\
	po								\
	scripts								\
	thunar-archive-plugin

distclean-local:
	rm -rf *.spec *.cache *~

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

EXTRA_DIST =								\
	THANKS

# vi:set ts=8 sw=8 noet ai nocindent syntax=automake:
