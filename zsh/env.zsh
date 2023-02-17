#!/bin/zsh

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/1000"
export XDG_CURRENT_DESKTOP="sway"
export XDG_SCREENSHOTS_DIR="$HOME"

# Directories
export CONFIG_DIR="$XDG_CONFIG_HOME"
export CACHE_DIR="$XDG_CACHE_HOME"
export SCRIPTS_DIR="$CONFIG_DIR/scripts"
export GO_DIR="$CONFIG_DIR/go"
export ZSH_DIR="$CONFIG_DIR/zsh"
export TMUX_DIR="$CONFIG_DIR/tmux"

# Configuration
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE
export HISTFILE="$CACHE_DIR/zsh/history"
export KEYS_DIR="$HOME/.keys"
export DISABLE_UPDATE_PROMPT="true"
export COMPLETION_WAITING_DOTS="true"
export LESS="-XFR"

# Appearance
export GTK_THEME="Arc-Dark"

# Applications
# export BROWSER="brave --enable-features=UseOzonePlatform --ozone-platform=wayland"
# export PAGER="nvimpager"
export MANPAGER="nvimpager"
export BROWSER="brave"
export EDITOR="nvim"
export TERMINAL="alacritty"
export READER="mupdf"

# ZSH
export ZSH="$CONFIG_DIR/omz"
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_CACHE_DIR="$CACHE_DIR/zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-${HOST}-${ZSH_VERSION}"
export ZSH_THEME="rice"

# Highlight
export HIGHLIGHT_DATADIR="$CONFIG_DIR/highlight/"
export HIGHLIGHT_TABWIDTH="2"

# Lastpass
export LPASS_CLIPBOARD_COMMAND="wl-copy"
export LPASS_AGENT_TIMEOUT=0

# GNUPG
export GPG_TTY="$(tty)"
export GNUPGHOME="$CONFIG_DIR/gnupg"

# Ranger
export RANGER_LOAD_DEFAULT_RC="FALSE"

# NPM
export NPM_CONFIG_USERCONFIG="$CONFIG_DIR/npm.conf"
export NVM_DIR="$CONFIG_DIR/nvm"

# Kubectl
export KUBE_DIR="$CONFIG_DIR/kube"
export KUBECONFIG="$KUBE_DIR/config.yaml"
export KUBE_CONFIG_PATH="$KUBECONFIG"
export KUBECACHEDIR="$CACHE_DIR/kube"
export MINIKUBE_HOME="$XDG_STATE_HOME/minikube"

# Docker
export DOCKER_CONFIG="$CONFIG_DIR/docker"

# Terraform
export TF_CLI_CONFIG_FILE="$CONFIG_DIR/terraform/config.tfrc"
export TF_DATA_DIR="$XDG_STATE_HOME/terraform"
export TF_PLUGIN_CACHE_DIR="$CACHE_DIR/terraform"

# Vault
export VAULT_TOKEN="$(cat $KEYS_DIR/vault.json | jq -r '.root_token')"
export VAULT_ADDR="$(cat $KEYS_DIR/vault.json | jq -r '.address')"
export VAULT_FORMAT="json"
export VAULT_SKIP_VERIFY="true"

# Neovim
export NVIM_DIR="$CONFIG_DIR/nvim"
export NVIM_CACHE_DIR="$CACHE_DIR/nvim"

# PostgreSQL
export PSQL_HISTORY="$CACHE_DIR/pg/history"
export PGUSER="postgres"
export PGPASSFILE="$CONFIG_DIR/pgpass.list"

# FZF
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND="fd --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_MARKS_FILE="$CONFIG_DIR/marks.list"

# Python
export PYTHONPATH="/usr/lib/python3.10"

# Rust
export CARGO_HOME="$CONFIG_DIR/cargo"
export CARGO_NET_GIT_FETCH_WITH_CLI="true"
export RUSTUP_HOME="$CONFIG_DIR/rustup"
export RUST_BACKTRACE=1

# Go
export GOPATH="$GO_DIR"

# Gcloud
export GCLOUD_PATH="/var/lib/google-cloud-sdk"
export USE_GKE_GCLOUD_AUTH_PLUGIN="true"

# Wine
export WINEPREFIX="$CONFIG_DIR/wine"

# Paths
if [ ! $ZSH_ENV_LOADED ]; then
  export LOCAL_BIN="$HOME/.local/bin"
  export GO_BIN="$GO_DIR/bin"
  export CARGO_BIN="$CONFIG_DIR/cargo/bin"
	export GCLOUD_BIN="$GCLOUD_PATH/bin"

  export PATH="$PATH:$LOCAL_BIN:$GO_BIN:$CARGO_BIN:$GCLOUD_BIN"

  export ZSH_ENV_LOADED=1
fi
