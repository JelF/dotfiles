# USE ON: bash zsh
alias emerge1="sudo ionice -n+1 nice -n+1 emerge"
alias emerge-world="sudo ionice -n+1 nice -n+1 emerge -avuDN --with-bdeps=y @world"

function emerge-update () {
  emerge1 --sync
  sudo layman -S
  emerge-world
}
