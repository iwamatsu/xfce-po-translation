# $Id: Makefile.am 27484 2008-08-17 20:16:50Z kelnos $

SUBDIRS =								\
	icons								\
	libxfcegui4							\
	docs								\
	po									\
	glade

AUTOMAKE_OPTIONS =							\
	1.8								\
	dist-bzip2

distclean-local:
	rm -rf libxfcegui4.spec *.cache *~

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

EXTRA_DIST = 								\
	AUTHORS								\
	COPYING								\
	ChangeLog							\
	INSTALL								\
	NEWS								\
	README								\
	TODO								\
	gtk-doc.make							\
	libxfcegui4.spec						\
	intltool-extract.in						\
	intltool-merge.in						\
	intltool-update.in

DISTCLEANFILES = \
	intltool-extract \
	intltool-merge \
	intltool-update

DISTCHECK_CONFIGURE_FLAGS = 						\
	--disable-debug							\
	--enable-gtk-doc						\
	--with-libglade-module-path=/tmp/$(PACKAGE)-distcheck/libglade	\
	--with-gladeui-module-path=/tmp/$(PACKAGE)-distcheck/gladeui-lib \
	--with-gladeui-data-root=/tmp/$(PACKAGE)-distcheck/gladeui-data

# vi:set ts=8 sw=8 noet ai nocindent syntax=automake:
