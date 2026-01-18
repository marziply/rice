#!/bin/zsh

unalias _ 2 &>/dev/null

# General
alias psg="ps aux | grep"
alias bctl="bluetoothctl"
alias px="pulsemixer"

# Neovim
alias n="nvim"
alias nn="n ${NVIM_DIR}/init.vim"
alias ne="n ${ZSH_DIR}/env.zsh"
alias na="n ${ZSH_DIR}/aliases.zsh"
alias sn="sudo -E nvim"

# ZSH
alias zs="source $ZSH_DIR/*.zsh"
alias zc="n $ZSH_DIR/init.zsh"
alias ze="n $ZSH_DIR/env.zsh"
alias za="n $ZSH_DIR/aliases.zsh"
alias zu="n $ZSH_DIR/utils.zsh"

# PostgreSQL
alias pgc="clear && pgcli postgres postgres"

# Virt manager
alias vs="sudo -E virsh"

# Pacman package manager
alias pm="sudo pacman"
alias pmu="pm -Syyu --noconfirm"
alias pmi="pm -S --noconfirm"
alias pmr="pm -Rvns --noconfirm"
alias pms='() { pm -Ss $1 || yms $1 }'
alias pmq="pm -Qs"
alias pmqq="pmq -q"

# Yay package manager
alias ymu="yay -Syyu --noconfirm"
alias ymi="yay -S --noconfirm"
alias yms="yay -Ss"

# SystemD
alias sc="sudo systemctl"
alias scu="systemctl --user"
alias scs="sc start"
alias sco="sc stop"
alias sct="sc status"
alias sce="sc enable"
alias scd="sc disable"
alias scr="sc restart"
alias sces="sce && scs"
alias scou="scu stop"
alias scsu="scu start"
alias sctu="scu status"
alias scru="scu restart"
alias sceu="scu enable"
alias scdu="scu disable"

# git
alias gacam="ga . && gcam"
alias gce="g commit --amend"
alias gcr="g conflicts --relative"

# Docker
alias d="sudo docker"
alias dr="d run"
alias drs="dr --entrypoint sh"
alias dp="d pull"
alias dc="d container"
alias di="d image"
alias dii="d images"
alias dps="d ps"
alias dco="dc stop"
alias dcs="dc start"
alias dcr="dc run"
alias dck="dc kill"
alias dcl="dc logs"
alias dcls="dc ls"
