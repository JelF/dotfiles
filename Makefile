include recipes/profile.mf

default: profile

install: default
	recipes/insert-to-file.sh "source $(pwd)/profile/result/.bashrc" $(HOME)/.bashrc
	recipes/insert-to-file.sh "source $(pwd)/profile/result/.bash_profile" $(HOME)/.bash_profile
	recipes/insert-to-file.sh "source $(pwd)/profile/result/.profile" $(HOME)/.profile
	recipes/insert-to-file.sh "source $(pwd)/profile/result/.zshrc" $(HOME)/.zshrc
