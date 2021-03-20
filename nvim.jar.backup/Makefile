
SHELL = /bin/bash
vim := $(if $(shell which nvim),nvim,$(shell which vim))
vim_version := '${shell $(vim) --version}'
XDG_CACHE_HOME ?= $(HOME)/.cache

default: install

install:
	@mkdir -vp "$(XDG_CACHE_HOME)/vim/"{backup,session,swap,tags,undo}; \
	$(vim)  -V1 -es -i NONE -N --noplugin -u core/dein.vim -c "try | call dein#update() | call dein#recache_runtimepath() | finally | echomsg '' | qall! | endtry"

upgrade:
	$(vim) -V1 -es -i NONE -N --noplugin -u init.vim -c "try | call dein#clear_state() | call dein#update() | finally | qall! | endtry"
