SUBDIRS = 								\
	panel-plugin							\
	pixmaps								\
	po

AUTOMAKE_OPTIONS = dist-bzip2

EXTRA_DIST =								\
	intltool-extract.in						\
	intltool-merge.in						\
	intltool-update.in

distclean-local:
	rm -rf *.cache *~ *.spec

dist-bz2: dist
	zcat $(PACKAGE)-$(VERSION).tar.gz | \
	bzip2 --best -c > $(PACKAGE)-$(VERSION).tar.bz2

distcheck-bz2: distcheck
	zcat $(PACKAGE)-$(VERSION).tar.gz | \
	bzip2 --best -c > $(PACKAGE)-$(VERSION).tar.bz2

DISTCLEANFILES =							\
	intltool-extract						\
	intltool-merge							\
	intltool-update


rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

