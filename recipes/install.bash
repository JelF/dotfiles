#!/bin/bash

function _emerge {
	sudo emerge -av $@
}

function _aptitude {
	sudo apititude install $@
}

function _brew {
	brew install $@
}

function check {
	which $1 &> /dev/null
}

if [ $# -eq 0 ]
then
	echo 'specify at least one argument'
	exit 63
fi

check emerge && _emerge $@ && exit
check aptitude && _aptitude $@ && exit
check brew && _brew $@ && exit

echo "Neither of emerge, aptitude or brew found
If you are running different package manager, please specify it's recipe in recipes/checkinstall.bash and make a pull request"
exit 1
