# vi: ft=sh

#!/bin/zsh

source "$ZSH_DIR/utils.zsh"

unalias _ 2&>/dev/null

# General
alias psg="ps aux | grep"
alias tldr="dr --rm -it -v $CACHE_DIR/tldr:/root/.tldr/cache nutellinoit/tldr"

# Neovim
alias n="nvim"
alias nrc="n $NVIM_DIR/init.vim"

# PostgreSQL
alias pgc="clear && pgcli postgres postgres"

# List device blocks
alias lb="lsblk -o name,size,fstype,mountpoints,uuid"

# Pacman package manager
alias pm="sudo pacman"
alias pmi="yes | pm -S"
alias pmr="yes | pm -Rvns"
alias pms="pm -Ss"
alias pmq="pm -Qs"
alias pmqq="pmq -q"

# Yay package manager
alias ym="yay"
alias ymi="ym -S"
alias yms="ym -Ss"

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

# Kubectl
alias k="kubectl --cache-dir $CACHE_DIR/kube"
alias kc="k --context"
# alias kcv="kc view"
# alias kcg="kc get"
# alias kcs="kc set"
alias ke="k explain"
alias kl="k logs"
alias kg="k get"
alias ki="k describe"
alias kip="ki pod"
alias kgp="kg pods"
alias kga="kg all"
alias kgaa="kg all --all-namespaces"
alias kd="k delete"
alias kdp="kd pod"
alias kdj="kd job"
alias km="kc minikube"
alias kme="km explain"
alias kml="km logs"
alias kmg="km get"
alias kmi="km describe"
alias kmip="kim pod"
alias kmgp="kmg pods"
alias kmga="kmg all"
alias kmgaa="kmg all --all-namespaces"
alias kmd="km delete"
alias kmdp="kmd pod"
alias kmdj="kmd job"
alias mk="minikube"
alias mks="mk start"
alias mkd="mk delete"
alias mko="mk stop"
alias mkp="mk pause"

# ZSH
alias zs="source $ZSH_DIR/*.zsh"
alias zc="n $ZSH_DIR/init.zsh"
alias ze="n $ZSH_DIR/env.zsh"
alias za="n $ZSH_DIR/aliases.zsh"
alias zu="n $ZSH_DIR/utils.zsh"

# Docker
alias d="sudo docker"
alias dr="d run"
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

# Veracrypt
alias vc="veracrypt"
alias vcd="vc -d"
alias vcl="vc -l"
alias vcm='vc --non-interactive -p "$(lpass show --password 1215307261831005367)"'
