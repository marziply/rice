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

current_tty="$(tty)"

if [[ "$current_tty" =~ ^/dev/tty[0-9]+$ ]]; then
  if [[ "${current_tty: -1}" == "1" ]]; then
    exec sway
  fi
else
  tmux source-file "$TMUX_DIR/tmux.conf"
fi

source "$ZSH_DIR/aliases.zsh"
source "$ZSH_DIR/utils.zsh"
source "$ZSH/oh-my-zsh.sh"
source "$NVM_DIR/nvm.sh"

bindkey -s "^Z" "ranger\n"
bindkey -s "^F" "fg\n"
bindkey -s "^V" "n\n"
bindkey -s "^\\" "zs && clear\n"

unalias _

rm -rf \
  "$HOME/.zcompdump" \
  "$HOME/Documents" \
  "$HOME/Downloads" \
  "$HOME/Music" \
  "$HOME/Videos" \
  "$HOME/Pictures"
