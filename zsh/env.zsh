# vi: ft=sh

#!/bin/zsh

export LOCAL_BIN="$HOME/.local/bin"
export PATH="$PATH:$LOCAL_BIN:$LOCAL_SCRIPTS"
export PYTHONPATH="/usr/lib/python3.9"

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
export NVIM_CACHE_DIR="$XDG_CACHE_HOME/nvim"
export NVIM_COC_LOG_FILE="$XDG_RUNTIME_DIR/coc.log"

export PSQL_HISTORY="$XDG_CACHE_HOME/pg/history"
export PGUSER=postgres

export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_MARKS_FILE="$XDG_CONFIG_HOME/marks"

export ZSH="$XDG_CONFIG_HOME/omz"
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_THEME="rice"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-$HOST-$ZSH_VERSION"

export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export RUSTUP_HOME="$XDG_CONFIG_HOME/rustup"

export KUBECONFIG="$XDG_CONFIG_HOME/kube/config.yml"

export DISABLE_UPDATE_PROMPT="true"
export COMPLETION_WAITING_DOTS="true"
export HISTSIZE=999999999
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export SAVEHIST="$HISTSIZE"
export HIGHLIGHT_DATADIR="$XDG_CONFIG_HOME/highlight/"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

export LESS="-XFR"
export LPASS_CLIPBOARD_COMMAND="wl-copy"
export LPASS_AGENT_TIMEOUT=0
