#!/bin/zsh

ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="rice"
ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-$HOST-$ZSH_VERSION"

FZF_MARKS_FILE="$XDG_CONFIG_HOME/marks"

DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"
HISTSIZE=999999999
HISTFILE="$XDG_CACHE_HOME/zsh/history"
SAVEHIST="$HISTSIZE"

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

alias brave="brave --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias pgc="clear && pgcli postgres postgres"
alias pm="sudo pacman -S"
alias pms="pacman -Ss"
alias y="yay -S"
alias ys="yay -Ss"
alias gacam="ga . && gcam"
alias ggpnv="ggpush --no-verify"

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.cargo/env"
source "$HOME/.rvm/scripts/rvm"

rm -rf "$HOME/.zcompdump"
