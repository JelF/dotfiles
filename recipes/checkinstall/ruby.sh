#!/bin/bash

VERSION=`cat versions/ruby`
case $1 in
  "deps")
    echo 'rbenv'
    ;;

  "marker")
    echo $HOME/.rbenv/versions/$VERSION/bin/ruby
    ;;

  "install")
    if rbenv versions | grep $VERSION
      then exit 0
    else
      rbenv install $VERSION
    fi
    ;;
esac
