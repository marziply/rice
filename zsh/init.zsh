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
  cargo \
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
  rustup \
  sudo \
  zsh-interactive-cd \
  # https://github.com/zdharma/fast-syntax-highlighting.git
  fast-syntax-highlighting \
  # https://github.com/urbainvaes/fzf-marks
  fzf-marks \
  # https://github.com/arzzen/calc.plugin.zsh
  calc \
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

alias brave="brave --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias pgc="pgcli postgres postgres --auto-vertical-output"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
alias pm="sudo pacman -S"
alias pms="pacman -Ss"
alias y="yay -S"
alias ys="yay -Ss"

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.cargo/env"
source "$HOME/.rvm/scripts/rvm"

rm -rf "$HOME/.zcompdump"
