#!/bin/bash

case $1 in
  "deps")
    echo 'git'
    ;;
  "marker")
    echo $HOME/.rbenv/version
    ;;

  "install")
    if [ -e $HOME/.rvm ]
    then
      echo 'RVM is installed and preventing rbenv to install'
      exit 1
    fi

    if [ -e $HOME/.rbenv/plugins/ruby-build ]; then exit 0; fi

    if [ ! -e $HOME/.rbenv ]; then
      git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
    fi

    git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
    ;;

  "post_install")
    export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
    hash -r 2>/dev/null
    ;;
esac
