#!/bin/zsh

ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-$HOST-$ZSH_VERSION"

DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"
HISTFILE="$XDG_CACHE_HOME/zsh/history"
SAVEHIST="$HISTSIZE"
HISTSIZE=999999999

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

setopt rmstarsilent
setopt inc_append_history
setopt share_history
setopt autocd

alias brave="brave --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias pgc="pgcli postgres postgres --auto-vertical-output"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"

bindkey -s '^o' 'ranger\n'

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.cargo/env"
source "/usr/share/nvm/init-nvm.sh"

# source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
# source $ZDOTDIR/plugins/zsh-interactive-cd.plugin.zsh
# source $ZDOTDIR/plugins/fzf-marks.plugin.zsh
# source $ZDOTDIR/plugins/fzf.plugin.zsh

rm -rf "$HOME/.zcompdump"
