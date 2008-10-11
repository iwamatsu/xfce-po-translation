# $Id: Makefile.am 2257 2006-12-19 19:49:00Z nick $

SUBDIRS =								\
	redhat								\
	icons								\
	src 								\
	po

distclean-local:
	rm -rf *.cache *~
	@rm -rf doc-pak

rpm: dist
	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.gz

deb:
	dpkg-buildpackage -uc -us -rfakeroot -i.svn

PKGFLAGS = --default \
	--pkgname=$(PACKAGE) \
	--pkgversion=$(VERSION) \
	--pkgrelease=0 \
	--pkglicense="GNU GPL" \
	--pkggroup="xfce"

doc-pak: README COPYING NEWS ChangeLog AUTHORS THANKS TODO
	mkdir -p $@
	cp -p $^ $@

tgz: doc-pak
	checkinstall -t slackware -S $(PKGFLAGS)
tbz: doc-pak
	checkinstall -t slackware -B $(PKGFLAGS)
tlz: doc-pak
	checkinstall -t slackware -L $(PKGFLAGS)

EXTRA_DIST =								\
	description-pak							\
	intltool-extract.in						\
	intltool-merge.in						\
	intltool-update.in

DISTCLEANFILES =							\
	intltool-extract						\
	intltool-merge							\
	intltool-update

# vi:set ts=8 sw=8 noet ai nocindent syntax=automake:
