SUBDIRS = \
	po \
	xfce4-volstatus-icon

AUTOMAKE_OPTIONS = \
	1.8 \
	dist-bzip2

distclean-local:
	-rm -rf *.cache *~

if MAINTAINER_MODE

$(top_srcdir)/configure: $(top_srcdir)/configure.ac.in
	[ -x $(top_srcdir)/autogen.sh ] && cd $(top_srcdir) && NOCONFIGURE=1 ./autogen.sh || /bin/true

checksums: distcheck
	md5sum $(PACKAGE)-$(VERSION).tar.bz2 > $(PACKAGE)-$(VERSION).tar.bz2.md5.asc
	sha1sum $(PACKAGE)-$(VERSION).tar.bz2 > $(PACKAGE)-$(VERSION).tar.bz2.sha1.asc

gpg-sign: checksums
	gpg -b --armor $(PACKAGE)-$(VERSION).tar.bz2

release: gpg-sign
	-mkdir releases/
	mv $(PACKAGE)-$(VERSION).tar.bz2* releases/
	-rm -f $(PACKAGE)-$(VERSION).tar.gz

endif
