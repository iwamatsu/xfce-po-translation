@SET_MAKE@

SUBDIRS = po panel-plugin

AUTOMAKE_OPTIONS = \
        dist-bzip2

distclean-local:
	rm -rf *.cache *~

dist-bz2: dist
	zcat $(PACKAGE)-$(VERSION).tar.gz | \
	  bzip2 --best -c > $(PACKAGE)-$(VERSION).tar.bz2

distcheck-bz2: distcheck
	zcat $(PACKAGE)-$(VERSION).tar.gz | \
	  bzip2 --best -c > $(PACKAGE)-$(VERSION).tar.bz2

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz
	
EXTRA_DIST =	\
	intltool-extract.in	\
	intltool-merge.in	\
	intltool-update.in
	
DISTCLEANFILES =                                                        \
intltool-extract                                                    \
intltool-merge                                                      \
intltool-update

