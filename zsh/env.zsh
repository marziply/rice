#!/bin/zsh

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_RUNTIME_DIR="/run/user/1000"
export XDG_CURRENT_DESKTOP="sway"
export XDG_SCREENSHOTS_DIR="$HOME"

# Directories
export CONFIG_DIR="$XDG_CONFIG_HOME"
export CACHE_DIR="$XDG_CACHE_HOME"
export STATE_DIR="$XDG_STATE_HOME"
export SCRIPTS_DIR="${CONFIG_DIR}/scripts"
export GO_DIR="${CONFIG_DIR}/go"
export ZSH_DIR="${CONFIG_DIR}/zsh"
export TMUX_DIR="${CONFIG_DIR}/tmux"

# Configuration
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE
export HISTFILE="${CACHE_DIR}/zsh/history"
export KEYS_DIR="${HOME}/.keys"
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
export ZSH_CACHE_DIR="${CACHE_DIR}/zsh"
export ZSH_COMPDUMP="${ZSH_CACHE_DIR}/zcompdump-${HOST}-${ZSH_VERSION}"
export ZSH_THEME="rice"

# Highlight
export HIGHLIGHT_DATADIR="${CONFIG_DIR}/highlight/"
export HIGHLIGHT_TABWIDTH="2"

# Lastpass
export LPASS_CLIPBOARD_COMMAND="wl-copy"
export LPASS_AGENT_TIMEOUT=0

# GNUPG
export GPG_TTY="$(tty)"
export GNUPGHOME="${CONFIG_DIR}/gnupg"

# Ranger
export RANGER_LOAD_DEFAULT_RC="FALSE"

# NPM
export NPM_CONFIG_USERCONFIG="${CONFIG_DIR}/npm.conf"
export NVM_DIR="$CONFIG_DIR/nvm"

# Kubernetes
# export MINIKUBE_HOME="${STATE_DIR}/minikube"
export KUBE_DIR="${CONFIG_DIR}/kube"
export KUBE_CONFIG_PATH="${KUBE_DIR}/config.yaml"
export KUBECONFIG="$KUBE_CONFIG_PATH"
export KUBECACHEDIR="${CACHE_DIR}/kube"

# Helm
export HELMFILE_TEMPDIR="/tmp/helmfile"

# Docker
export DOCKER_CONFIG="${CONFIG_DIR}/docker"

# Vault
# export VAULT_TOKEN=`jq -r '.root_token' "${KEYS_DIR}/vault.json"`
# export VAULT_ADDR=`jq -r '.address' "${KEYS_DIR}/vault.json"`
export VAULT_FORMAT="json"
export VAULT_SKIP_VERIFY="true"

# Neovim
export NVIM_DIR="${CONFIG_DIR}/nvim"
export NVIM_CACHE_DIR="${CACHE_DIR}/nvim"

# PostgreSQL
export PGUSER="postgres"
export PGPASSFILE="${CONFIG_DIR}/pgpass.list"
export PSQL_HISTORY="${CACHE_DIR}/pg/history"

# FZF
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND="fd --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_MARKS_FILE="${CONFIG_DIR}/marks.list"

# Python
export PYTHONPATH="/usr/lib/python3.10"

# Go
export GOPATH="$GO_DIR"
export GOBIN="${GO_DIR}/bin"
export GOPRIVATE="buf.build/gameye,buf.build/gen/go/gameye,gitlab.com/gameye"

# Gcloud
export GCLOUD_PATH="/var/lib/google-cloud-sdk"
export USE_GKE_GCLOUD_AUTH_PLUGIN="true"

# Wine
export WINEPREFIX="${CONFIG_DIR}/wine"

# Redis
export REDISCLI_RCFILE="${CONFIG_DIR}/redis.conf"
export REDISCLI_HISTFILE="${CACHE_DIR}/redis.log"

# Android
export ANDROID_HOME="${HOME}/android"
export ANDROID_USER_HOME="${CONFIG_DIR}/android"
export STUDIO_JDK="${ANDROID_USER_HOME}/jdk"

# AWS
export AWS_CONFIG_FILE="${CONFIG_DIR}/aws/config.toml"
export AWS_DATA_PATH="${CONFIG_DIR}/aws/models"
export AWS_SHARED_CREDENTIALS_FILE="${CONFIG_DIR}/aws/credentials.toml"

# Bun
export BUN_INSTALL="${CONFIG_DIR}/bun"
export BUN_BIN="${BUN_INSTALL}/bin"

# Rust
export CARGO_HOME="${CONFIG_DIR}/cargo"
export CARGO_NET_GIT_FETCH_WITH_CLI="true"
export RUSTUP_HOME="${CONFIG_DIR}/rustup"
export RUST_BACKTRACE=1

# Rust cache wrapper
if [[ $(command -v sccache) ]]; then
  export RUSTC_WRAPPER="$(which sccache)"
fi

# Porter
export PORTER_BIN="${HOME}/.porter"

# Misc
export SSH_AUTH_SOCK=/run/user/1000/ssh-agent.socket

# Paths
if [[ ! $ZSH_ENV_LOADED ]]; then
  export LOCAL_BIN="${HOME}/.local/bin"
  export GO_BIN="${GO_DIR}/bin"
  export CARGO_BIN="${CONFIG_DIR}/cargo/bin"
  export GCLOUD_BIN="${GCLOUD_PATH}/bin"

  if [[ $(command -v nvm) ]]; then
    export NVM_LIB="${NVM_DIR}/versions/node/$(nvm version)/lib"
  fi

  export ZSH_ENV_LOADED=1
fi

export PATHS=(
  $PATH
  $LOCAL_BIN
  $GO_BIN
  $CARGO_BIN
  $GCLOUD_BIN
  $PORTER_BIN
  $BUN_BIN
)
export PATH=$(echo $PATHS | tr ' ' ':')
