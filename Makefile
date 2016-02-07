include recipes/profile.mf

default: profile

install: default
	recipes/insert-to-file.sh 'source $$(HOME)/profile/result/.bashrc' $(HOME)/.bashrc
	recipes/insert-to-file.sh 'source $$(HOME)/profile/result/.bash_profile' $(HOME)/.bash_profile
	recipes/insert-to-file.sh 'source $$(HOME)/profile/result/.profile' $(HOME)/.profile
	recipes/insert-to-file.sh 'source $$(HOME)/profile/result/.zshrc' $(HOME)/.zshrc

uninstall:
	sed -i '/source $$(HOME)\/profile\/result\/.bashrc/d' $(HOME)/.bashrc
	sed -i '/source $$(HOME)\/profile\/result\/.bash_profile/d' $(HOME)/.bash_profile
	sed -i '/source $$(HOME)\/profile\/result\/.profile/d' $(HOME)/.profile
	sed -i '/source $$(HOME)\/profile\/result\/.zshrc/d' $(HOME)/.zshrc
