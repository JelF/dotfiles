#!/bin/bash

case $1 in
  "marker")
    which git 1>/dev/null || echo 'virtual'
    ;;

  "install")
    which git 1>/dev/null && exit 0
    recipes/install.bash git
    ;;
esac
