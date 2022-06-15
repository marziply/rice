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

# Managers
source "$ZSH/oh-my-zsh.sh"
source "$NVM_DIR/nvm.sh"

# Modules
source "$ZSH_DIR/aliases.zsh"
source "$ZSH_DIR/utils.zsh"

start_sway
generate_marks

bindkey -s "^Z" "ranger\n"
bindkey -s "^F" "fg\n"
bindkey -s "^V" "n\n"
bindkey -s "^H" "cd $HOME\n"
bindkey -s "^\\" "zs && clear\n"

setopt rmstarsilent
setopt inc_append_history
setopt share_history
setopt autocd

rm -rf \
  "$HOME/.zcompdump" \
  "$HOME/Documents" \
  "$HOME/Downloads" \
  "$HOME/Music" \
  "$HOME/Videos" \
  "$HOME/Pictures"
