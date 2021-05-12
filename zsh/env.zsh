#!/bin/zsh

if [[ $TERM == "tmux" ]]; then
  export GEM_HOME="$HOME/.rvm/gems/ruby-3.0.0"
  export GEM_PATH="$GEM_HOME/bin"

  export RVM_BIN="$HOME/.rvm/bin"
  export LOCAL_BIN="$HOME/.local/bin"

  export PATH="$PATH:$LOCAL_BIN:$RVM_BIN"
  export PYTHONPATH="/usr/lib/python3.9"
fi

export BROWSER="brave --enable-features=UseOzonePlatform --ozone-platform=wayland"
export EDITOR="nvim"
export TERMINAL="alacritty"
export READER="zathura"

export GTK_THEME="Aritim-Dark"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="/run/user/1000"

export NVIM_DIR="$XDG_CONFIG_HOME/nvim"
export NVIM_COC_LOG_FILE="$XDG_RUNTIME_DIR/coc.log"

export PSQL_HISTORY="$XDG_CACHE_HOME/pg/history"
export PGUSER=postgres

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm.conf"

export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export LESS="-XFR"
