#!/bin/zsh

# vi: ft=sh

plugins=(
  git
  sudo
  rust
  colored-man-pages
  colorize
  common-aliases
  fbterm
  fzf
  git-extras
  gitfast
  nvm
  ripgrep
  # https://github.com/zsh-users/zsh-completions
  # zsh-autocompletions
  # https://github.com/changyuheng/zsh-interactive-cd
  zsh-interactive-cd
  # https://github.com/hlissner/zsh-autopair
  zsh-autopair
  # https://github.com/djui/alias-tips
  alias-tips
  # https://github.com/z-shell/F-Sy-H
  F-Sy-H
  # https://github.com/urbainvaes/fzf-marks
  fzf-marks
)

# Omg My ZSH
if [[ -d "$ZSH" ]]; then
  source "${ZSH}/oh-my-zsh.sh"
fi

# ZSH modules
if [[ -d "$ZSH_DIR" ]]; then
  source "${ZSH_DIR}/aliases.zsh"
  source "${ZSH_DIR}/utils.zsh"
fi

if [[ -d "$NVM_DIR" ]]; then
  source "${NVM_DIR}/nvm.sh"
fi

# Google Cloud
if [[ -d "$GCLOUD_PATH" ]]; then
  source "${GCLOUD_PATH}/path.zsh.inc"
  source "${GCLOUD_PATH}/completion.zsh.inc"
fi

# Bun
if [[ -d "$BUN_INSTALL" ]]; then
  source "${BUN_INSTALL}/_bun"
fi

bindkey -s "^Z" "ranger\n"
bindkey -s "^V" "n\n"

setopt rmstarsilent
setopt inc_append_history
setopt share_history
setopt autocd

zstyle ":completion:*" list-prompt ""
zstyle ":completion:*" select-prompt ""

autoload -Uz compinit && compinit -d "${ZSH_CACHE_DIR}/zcompdump"
autoload -U +X bashcompinit && bashcompinit

complete -o nospace -C $(which aws_completer) aws
complete -o nospace -C $(which vault) vault
complete -o nospace -C $(which terraform) terraform
complete -o nospace -C $(which tk) tk
complete -o nospace -C $(which helmfile) helmfile
complete -o nospace -C $(which terramate) terramate install-completions

eval $(kubectl completion zsh)
eval $(just --completions zsh)

ssh-add -q ~/.keys/ssh/marziply/prv.pem
lpass sync -b --color never
genmarks
startwm

rm -rf \
  "${HOME}/Documents" \
  "${HOME}/Downloads" \
  "${HOME}/Music" \
  "${HOME}/Videos" \
  "${HOME}/Pictures"
