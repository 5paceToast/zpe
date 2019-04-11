SHELL := zsh
PATH  := $(PWD)/zunit:$(PATH)

BASE_zunit := https://github.com/zunit-zsh/zunit/releases/download
VER_zunit  := v0.8.2
BASE_revolver := https://raw.githubusercontent.com/molovo/revolver
VER_revolver  := v0.2.4

all: zpe.zwc

zpe.zwc: $(wildcard lib/*)
	zcompile -U $@ $^

.PHONY: test
test: zunit/zunit zunit/revolver $(wildcard tests/*) zpe.zwc
	zunit

zunit/zunit:
	wget ${BASE_zunit}/${VER_zunit}/zunit -P zunit
	chmod +x $@

zunit/revolver:
	wget ${BASE_revolver}/${VER_revolver}/revolver -P zunit
	chmod +x $@

.PHONY: clean
clean:
	rm -f zpe.zwc zunit/zunit zunit/revolver
