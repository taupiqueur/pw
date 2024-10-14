PREFIX ?= $(HOME)/.local

# General options
name = pw
version = $(shell git describe --tags --always)
target = $(shell llvm-config --host-target)

# Build options
static = no

ifeq ($(static),yes)
  flags += --static
endif

build:
	shards build --release $(flags)
	gzip -9 -f -k extra/man/pw.1
	mandoc -I os= -T html -O style="man-style.css",man="https://man.archlinux.org/man/%N.%S" extra/man/pw.1 > extra/man/pw.1.html

test:
	crystal spec

release: clean build
	mkdir -p releases
	tar caf releases/$(name)-$(version)-$(target).tar.xz bin/pw extra/man/pw.1.gz extra/shell-completion/pw.bash extra/shell-completion/pw.zsh extra/shell-completion/pw.fish

install: build
	install -d $(DESTDIR)$(PREFIX)/bin $(DESTDIR)$(PREFIX)/share/man/man1 $(DESTDIR)$(PREFIX)/share/bash-completion/completions $(DESTDIR)$(PREFIX)/share/zsh/site-functions $(DESTDIR)$(PREFIX)/share/fish/vendor_completions.d
	install -m 0755 bin/pw $(DESTDIR)$(PREFIX)/bin
	install -m 0644 extra/man/pw.1.gz $(DESTDIR)$(PREFIX)/share/man/man1
	install -m 0644 extra/shell-completion/pw.bash $(DESTDIR)$(PREFIX)/share/bash-completion/completions
	install -m 0644 extra/shell-completion/pw.zsh $(DESTDIR)$(PREFIX)/share/zsh/site-functions/_pw
	install -m 0644 extra/shell-completion/pw.fish $(DESTDIR)$(PREFIX)/share/fish/vendor_completions.d

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/pw $(DESTDIR)$(PREFIX)/share/man/man1/pw.1.gz $(DESTDIR)$(PREFIX)/share/bash-completion/completions/pw.bash $(DESTDIR)$(PREFIX)/share/zsh/site-functions/_pw $(DESTDIR)$(PREFIX)/share/fish/vendor_completions.d/pw.fish

clean:
	git clean -d -f -X
