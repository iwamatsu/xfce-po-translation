@SET_MAKE@

SUBDIRS = \
	pixmaps \
	xfmedia \
	plugins \
	po \
	src \
	doc

appsdir = $(datadir)/applications
apps_in_files = xfmedia.desktop.in
apps_DATA = $(apps_in_files:.desktop.in=.desktop)
@INTLTOOL_DESKTOP_RULE@

EXTRA_DIST = \
	$(apps_in_files) \
	configure.ac.in \
	intltool-extract.in \
	intltool-merge.in \
	intltool-update.in \
	xfmedia.spec \
	TODO \
	NEWS \
	README.plugins \
	README.remote

DISTCLEANFILES = \
	intltool-extract \
	intltool-merge \
	intltool-update \
	xfmedia.spec \
	$(apps_DATA)

distclean-local:
	-rm -rf	*.cache *.log $(PACKAGE)-$(VERSION)* *~ $(apps_DATA)

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

docs:
	$(MAKE) -C doc docs

ACLOCAL_AMFLAGS = -I m4

if MAINTAINER_MODE
$(top_srcdir)/configure: $(top_srcdir)/configure.ac.in
	[ -x $(top_srcdir)/autogen.sh ] && cd $(top_srcdir) && NOCONFIGURE=1 ./autogen.sh || /bin/true
endif

checksums: dist
	md5sum $(PACKAGE)-$(VERSION).tar.gz  > $(PACKAGE)-$(VERSION).tar.gz.md5.asc
	md5sum $(PACKAGE)-$(VERSION).tar.bz2 > $(PACKAGE)-$(VERSION).tar.bz2.md5.asc
	sha1sum $(PACKAGE)-$(VERSION).tar.gz  > $(PACKAGE)-$(VERSION).tar.gz.sha1.asc
	sha1sum $(PACKAGE)-$(VERSION).tar.bz2 > $(PACKAGE)-$(VERSION).tar.bz2.sha1.asc

gpg-sign: checksums
	gpg -b --armor $(PACKAGE)-$(VERSION).tar.gz
	gpg -b --armor $(PACKAGE)-$(VERSION).tar.bz2

release: gpg-sign
	-mkdir releases/
	mv $(PACKAGE)-$(VERSION).* releases/
