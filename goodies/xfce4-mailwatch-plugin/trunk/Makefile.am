@SET_MAKE@

SUBDIRS = \
	doc \
	libmailwatch-core \
	panel-plugin \
	pixmaps \
	po

$(top_srcdir)/configure: $(top_srcdir)/configure.ac
	[ -x $(top_srcdir)/autogen.sh ] && cd $(top_srcdir) && NOCONFIGURE=1 ./autogen.sh || /bin/true

html:
	$(MAKE) -C doc html

EXTRA_DIST = \
	intltool-extract.in \
	intltool-merge.in \
	intltool-update.in \
	TODO

DISTCLEANFILES = \
	intltool-extract \
	intltool-merge \
	intltool-update

checksums: distcheck
	sha1sum $(PACKAGE)-$(VERSION).tar.bz2 > $(PACKAGE)-$(VERSION).tar.bz2.sha1.asc

gpg-sign: checksums
	gpg -b --armor $(PACKAGE)-$(VERSION).tar.bz2

release: gpg-sign
	-mkdir releases/
	mv $(PACKAGE)-$(VERSION).tar.bz2* releases/
	-rm $(PACKAGE)-$(VERSION).tar.gz
