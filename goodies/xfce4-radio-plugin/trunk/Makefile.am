@SET_MAKE@

SUBDIRS = panel-plugin po icons

distclean-local:
	rm -rf *.cache *~

EXTRA_DIST =								\
	README								\
	intltool-extract.in						\
	intltool-merge.in						\
	intltool-update.in

DISTCLEANFILES =							\
	intltool-extract						\
	intltool-merge							\
	intltool-update

dist-hook:
	svn2cl
	cp ChangeLog $(distdir)
