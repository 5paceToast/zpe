SHELL := zsh

all: zpe.zwc

zpe.zwc: $(wildcard lib/*)
	zcompile $@ $^

.PHONY: clean
clean:
	rm -f zpe.zwc
