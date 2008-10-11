# $Id: Makefile.am 2117 2006-10-22 15:45:43Z nick $

SUBDIRS = 								\
	po								\
	src								\
	icons

distclean-local:
	rm -rf *.spec *.cache *~

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz
	@rm -f $(PACKAGE)-$(VERSION).tar.gz

servicedir = $(datadir)/dbus-1/services
service_in_files = org.freedesktop.Notifications.service.in
service_DATA = $(service_in_files:.service.in=.service)
%.service: %.service.in
	sed -e "s,\@libexecdir\@,$(libexecdir),g" < $< > $@

EXTRA_DIST =								\
	intltool-extract.in						\
	intltool-merge.in						\
	intltool-update.in						\
	$(service_in_files)

DISTCLEANFILES =							\
	intltool-extract						\
	intltool-merge 							\
	intltool-update							\
	$(service_DATA)
