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

# Gcloud
if [ -d "$GCLOUD_PATH" ]; then
	source "$GCLOUD_PATH/path.zsh.inc"
	source "$GCLOUD_PATH/completion.zsh.inc"
fi

lpass sync -b --color never

# start_sway
generate_marks

# zle     -N     fzf-history-widget-accept
# bindkey '^X^R' fzf-history-widget-accept

# zle -N fzf-history fzf_history
# bindkey "^R" fzf-history

bindkey -s "^Z" "ranger\n"
bindkey -s "^V" "n\n"

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
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
