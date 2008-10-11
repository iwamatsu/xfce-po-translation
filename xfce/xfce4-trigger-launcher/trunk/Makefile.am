@SET_MAKE@

SUBDIRS = panel-plugin po

EXTRA_DIST =								\
	README								\
	intltool-extract.in                                             \
	intltool-merge.in                                               \
	intltool-update.in                                              \
	xfce4-trigger-launcher.spec

DISTCLEANFILES =                                                        \
	intltool-extract                                                \
	intltool-merge                                                  \
	intltool-update
                        
distclean-local:
	rm -rf *.cache xfce4-trigger-launcher.spec *~

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

dist-bz2: dist
	zcat $(PACKAGE)-$(VERSION).tar.gz | bzip2 --best -c > $(PACKAGE)-$(VERSION).tar.bz2

distcheck-bz2: distcheck
	zcat $(PACKAGE)-$(VERSION).tar.gz | bzip2 --best -c > $(PACKAGE)-$(VERSION).tar.bz2
