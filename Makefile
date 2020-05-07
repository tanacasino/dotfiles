.PHONY: help install

DOTFILES_HOME := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))


help:
	@echo Install dotfiles: make install

install:
	$(DOTFILES_HOME)/setup.sh

