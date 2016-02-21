include recipes/profile.mf
PWD=$(shell pwd)

.PHONY: install uninstall profile default
default: profile

install: default
	recipes/insert-to-file.sh 'source $(PWD)/profile/result/.bashrc' $(HOME)/.bashrc
	recipes/insert-to-file.sh 'source $(PWD)/profile/result/.bash_profile' $(HOME)/.bash_profile
	recipes/insert-to-file.sh 'source $(PWD)/profile/result/.profile' $(HOME)/.profile
	recipes/insert-to-file.sh 'source $(PWD)/profile/result/.zshrc' $(HOME)/.zshrc

uninstall:
	sed -i '/source $(PWD)\/profile\/result\/.bashrc/d' $(HOME)/.bashrc
	sed -i '/source $(PWD)\/profile\/result\/.bash_profile/d' $(HOME)/.bash_profile
	sed -i '/source $(PWD)\/profile\/result\/.profile/d' $(HOME)/.profile
	sed -i '/source $(PWD)\/profile\/result\/.zshrc/d' $(HOME)/.zshrc
