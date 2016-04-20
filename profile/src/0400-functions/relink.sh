# USE ON: zsh bash

function rl() {
  mv $1 $2 && 
  ln -s `readlink -m $2` $1
}
