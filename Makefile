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

test:
	crystal spec

release: clean build
	mkdir -p releases
	tar caf releases/$(name)-$(version)-$(target).tar.xz bin/pw

install: build
	install -d ~/.local/bin
	install bin/pw ~/.local/bin

uninstall:
	rm -f ~/.local/bin/pw

clean:
	git clean -d -f -X
