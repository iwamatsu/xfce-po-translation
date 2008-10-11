# $Id: Makefile.am 24611 2007-01-20 09:55:09Z benny $

SUBDIRS =								\
	libxfce4util							\
	docs								\
	po								\
	xfce4-kiosk-query

AUTOMAKE_OPTIONS =							\
	1.8								\
	dist-bzip2

distclean-local:
	rm -rf libxfce4util.spec *.cache *~

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

EXTRA_DIST =								\
	ChangeLog.pre-4.2.0						\
	README.Kiosk							\
	THANKS								\
	TODO								\
	gtk-doc.make							\
	libxfce4util.spec

DISTCHECK_CONFIGURE_FLAGS =						\
	--enable-gtk-doc

# vi:set ts=8 sw=8 noet ai nocindent syntax=automake:
