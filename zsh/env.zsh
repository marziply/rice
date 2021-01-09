#!/bin/zsh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export READER="zathura"

export NVIM_DIR="$XDG_CONFIG_HOME/nvim"
export NVIM_COC_LOG_FILE="$XDG_RUNTIME_DIR/coc.log"

export PATH="$HOME/.local/bin:$PATH"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/history"
export PGUSER=postgres

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm.conf"

export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
