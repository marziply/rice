# vi: ft=sh

#!/bin/zsh

if [[ $TERM == "tmux" ]]; then
  export GEM_HOME="$HOME/.rvm/gems/ruby-3.0.0"
  export GEM_PATH="$GEM_HOME/bin"

  export LOCAL_BIN="$HOME/.local/bin"

  export PATH="$PATH:$LOCAL_BIN"
  export PYTHONPATH="/usr/lib/python3.9"
fi

# export BROWSER="brave --enable-features=UseOzonePlatform --ozone-platform=wayland"
export EDITOR="nvim"
export TERMINAL="alacritty"
export READER="zathura"
export GPG_TTY="$(tty)"

export GTK_THEME="Aritim-Dark"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="/run/user/1000"
export XDG_SCREENSHOTS_DIR="$HOME"

export RANGER_LOAD_DEFAULT_RC="FALSE"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm.conf"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"

export NVIM_DIR="$XDG_CONFIG_HOME/nvim"
export NVIM_COC_LOG_FILE="$XDG_RUNTIME_DIR/coc.log"

export PSQL_HISTORY="$XDG_CACHE_HOME/pg/history"
export PGUSER=postgres

export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_MARKS_FILE="$XDG_CONFIG_HOME/marks"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="rice"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-$HOST-$ZSH_VERSION"

export RVM_DIR="$HOME/.rvm"
export RVM_BIN="$RVM_DIR/bin"

export DISABLE_UPDATE_PROMPT="true"
export COMPLETION_WAITING_DOTS="true"
export HISTSIZE=999999999
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export SAVEHIST="$HISTSIZE"

export LESS="-XFR"
export LPASS_CLIPBOARD_COMMAND="wl-copy"
export LPASS_AGENT_TIMEOUT=0
