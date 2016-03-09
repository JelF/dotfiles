PWD=$(shell pwd)
BASH=$(shell which env) BASH_ENV=$(PWD)/.make_env bash

include recipes/profile.mf
include recipes/prereq.mf

.PHONY: install uninstall profile default bash virtual
default: profile prereq


install: default bash
	$(BASH) recipes/insert-to-file.sh 'source $(PWD)/profile/result/.bashrc' $(HOME)/.bashrc
	$(BASH) recipes/insert-to-file.sh 'source $(PWD)/profile/result/.bash_profile' $(HOME)/.bash_profile
	$(BASH) recipes/insert-to-file.sh 'source $(PWD)/profile/result/.profile' $(HOME)/.profile
	$(BASH) recipes/insert-to-file.sh 'source $(PWD)/profile/result/.zshrc' $(HOME)/.zshrc

uninstall:
	sed -i '\#source $(PWD)/profile/result/.bashrc#d' $(HOME)/.bashrc
	sed -i '\#source $(PWD)/profile/result/.bash_profile#d' $(HOME)/.bash_profile
	sed -i '\#source $(PWD)/profile/result/.profile#d' $(HOME)/.profile
	sed -i '\#source $(PWD)/profile/result/.zshrc#d' $(HOME)/.zshrc

bash:
	rm .make_env || true
	echo "source ${HOME}/.bashrc" >> .make_env
	echo "export MAKE_ROOT=$(PWD)" >> .make_env
