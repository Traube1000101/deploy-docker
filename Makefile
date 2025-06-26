PREFIX = /usr

all:
	@echo Run \'make install\' to install deploy-docker.

install:
	@install -D -m755 deploy-docker.sh $(DESTDIR)$(PREFIX)/bin/deploy-docker

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/deploy-docker