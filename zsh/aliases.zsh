#!/bin/zsh

source "${ZSH_DIR}/utils.zsh"

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

# PostgreSQL
alias pgc="clear && pgcli postgres postgres"

# OS Query
alias oj='() { osqueryi --json "$1" | jq }'
alias soj='() { sudo osqueryi --json "$1" | jq }'

# Virt manager
alias vs="sudo -E virsh"

# List device blocks
alias lb="lsblk -o name,size,fstype,mountpoints,uuid"

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
alias ggpnv="ggpush --no-verify"
alias gce="g commit --amend"
alias gcr="g conflicts --relative"

# Spotify
alias sp="spotify_player"
alias spr="scru spotifyd && sp"

# Kubectl
alias km="kc minikube"
alias kme="km explain"
alias kml="km logs"
alias kmg="km get"
alias kmi="km describe"
alias kmd="km delete"
alias vk="vipe | xargs -I % kubectl"

# Minikube
alias mk="minikube"
alias mks="mk start"
alias mko="mk stop"
alias mkp="mk pause"
alias mki="mk status"
alias mkd="mk delete"
alias mkda"mkd --all --purge"

# Terraform
alias tf="terraform"
alias tfi="tf init"
alias tfp="tf plan"
alias tfa="tf apply"
alias tfaa="tfa -auto-approve"

# ZSH
alias zs="source $ZSH_DIR/*.zsh"
alias zc="n $ZSH_DIR/init.zsh"
alias ze="n $ZSH_DIR/env.zsh"
alias za="n $ZSH_DIR/aliases.zsh"
alias zu="n $ZSH_DIR/utils.zsh"

# Docker
alias d="sudo docker"
alias dr="d run"
alias drsh="dr --entrypoint sh"
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
alias stopc='dco $(dcl -lq)'

# Android
alias emu='ANDROID_SDK_HOME=$ANDROID_HOME emulator'

# Veracrypt
# alias vc="veracrypt"
# alias vcd="vc -d"
# alias vcl="vc -l"
# alias vcm='\
#   vc \
#     --non-interactive \
#     -p "$(lpass show --password 1215307261831005367)" \
# '
