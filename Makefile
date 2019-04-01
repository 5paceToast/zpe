SHELL := zsh

all: zpe.zwc

zpe.zwc: $(wildcard lib/*)
	zcompile -U $@ $^

.PHONY: clean
clean:
	rm -f zpe.zwc
