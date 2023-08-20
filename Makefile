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
	tar caf releases/$(name)-$(version)-$(target).tar.xz bin/pw extra/man/pw.1.gz extra/shell-completion/pw.bash

install: build
	install -d ~/.local/bin ~/.local/share/man/man1 ~/.local/share/bash-completion/completions
	install -m 0755 bin/pw ~/.local/bin
	install -m 0644 extra/man/pw.1.gz ~/.local/share/man/man1
	install -m 0644 extra/shell-completion/pw.bash ~/.local/share/bash-completion/completions

uninstall:
	rm -f ~/.local/bin/pw ~/.local/share/man/man1/pw.1.gz ~/.local/share/bash-completion/completions/pw.bash

clean:
	git clean -d -f -X
