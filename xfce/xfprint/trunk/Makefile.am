@SET_MAKE@

SUBDIRS = libxfprint 		\
          doc 			\
	  po 			\
	  icons			\
	  xfprint 		\
	  xfprint-manager 	\
	  printing-systems	\
	  xfprint-settings

EXTRA_DIST =								\
	intltool-extract.in						\
	intltool-merge.in						\
	intltool-update.in

DISTCLEANFILES =							\
	intltool-extract						\
	intltool-merge							\
	intltool-update							\
	xfprint.spec

AUTOMAKE_OPTIONS =							\
	1.8								\
	dist-bzip2

distclean-local:
	rm -rf *.cache *~

html:
	make -C doc html

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

DISTCHECK_CONFIGURE_FLAGS =						\
	--enable-gtk-doc						\
	--enable-xsltproc



