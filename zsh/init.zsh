# vi: ft=sh

#!/bin/zsh

plugins=(\
  git \
  sudo \
  rust \
  colored-man-pages \
  colorize \
  common-aliases \
  fbterm \
  fzf \
  git-extras \
  gitfast \
  nvm \
  ripgrep \
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

tmux source-file "$XDG_CONFIG_HOME/tmux/tmux.conf"

gpnv() {
  git add .
  git commit -am "$1"
  git push origin "$(git_current_branch)" --no-verify
}

request() {
  /usr/bin/http \
    -jb \
    --check-status \
    "$1" \
    "$2" \
    "Authorization:Bearer DEV_TOKEN" \
    "${@:3}"
}

api_request() {
  red=`tput setaf 1`
  method=$1
  url=$2

  shift 2

  result=$(request "$method" ":3000/api/$url" $@)

  if [[ $? -ge 4 ]]; then
    echo $red

    jq .message -r <<< $result
  else
    jq <<< $result
  fi
}

get() {
  api_request GET $@
}

put() {
  api_request PUT $@
}

post() {
  api_request POST $@
}

del() {
  api_request DELETE $@
}

startc() {
  sudo docker run \
    --env-file=.env \
    --net=host \
    --init \
    --rm \
    -it \
    $@
}

source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$ZSH/oh-my-zsh.sh"
source "$HOME/.cargo/env"

bindkey -s "^Z" "ranger\n"
bindkey -s "^F" "fg\n"
bindkey -s "^V" "n\n"
bindkey -s "^\\" "zs && clear\n"

unalias _

rm -rf "$HOME/.zcompdump"
rm -rf \
  "$HOME/Documents" \
  "$HOME/Downloads" \
  "$HOME/Music" \
  "$HOME/Videos" \
  "$HOME/Pictures"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
