# vi: ft=sh

#!/bin/zsh

plugins=(\
  git \
  sudo \
  cargo \
  rustup \
  colored-man-pages \
  colorize \
  common-aliases \
  fbterm \
  fzf \
  git-extras \
  gitfast \
  nvm \
  ripgrep \
  rust \
  zsh-interactive-cd \
  # https://github.com/zdharma/fast-syntax-highlighting.git
  fast-syntax-highlighting \
  # https://github.com/urbainvaes/fzf-marks
  fzf-marks \
  # https://github.com/hlissner/zsh-autopair
  zsh-autopair \
  # https://github.com/djui/alias-tips
  alias-tips \
  # https://github.com/robertzk/send.zsh
  send \
)

setopt rmstarsilent
setopt inc_append_history
setopt share_history
setopt autocd

tmux source-file "$XDG_CONFIG_HOME/tmux.conf"

gpnv() {
  git add .
  git commit -am "$1"
  git push origin "$(git_current_branch)" --no-verify
}

request() {
  red=`tput setaf 1`
  method=$1
  url=$2

  shift 2

  result=$(\
    /usr/bin/http \
    -jb \
    --check-status \
    "$method" \
    ":3000/api/$url" \
    "Authorization:Bearer DEV_TOKEN" $@ \
  )

  if [[ $? -ge 4 ]]; then
    echo $red

    jq .message -r <<< $result
  else
    jq <<< $result
  fi
}

get() {
  request GET $@
}

put() {
  request PUT $@
}

post() {
  request POST $@
}

del() {
  request DELETE $@
}

startc() {
  sudo docker run \
    --env-file=.env \
    --net=host \
    --init \
    --rm \
    -it \
    $1
}

source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$ZSH/oh-my-zsh.sh"
source "$HOME/.cargo/env"
source "$HOME/.rvm/scripts/rvm"

bindkey -s "^Z" "ranger \n"

rm -rf "$HOME/.zcompdump"
rm -rf \
  "$HOME/Documents" \
  "$HOME/Downloads" \
  "$HOME/Music" \
  "$HOME/Videos" \
  "$HOME/Pictures"
