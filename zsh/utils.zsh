#!/bin/zsh

marks_list="${CONFIG_DIR}/marks.list"
default_marks=(
  "config : ${CONFIG_DIR}"
  "rocinante : ${HOME}/dev/rocinante"
  "projects : ${HOME}/dev/projects"
  "work : ${HOME}/dev/work"
)

start_sway() {
  current_tty="$(tty)"

  if [[ "$current_tty" =~ ^/dev/tty[0-9]+$ ]]; then
    if [[ "${current_tty: -1}" == "1" ]]; then
      exec sway
    fi
  else
    tmux source-file "${TMUX_DIR}/tmux.conf"
  fi
}

generate_marks() {
  dirs=`stat ${HOME}/dev/{lib,work,projects}/* -c '%Y %n' | sort -r`
  dirs_count=`echo $dirs | wc -l`
  total_marks=`cat $marks_list | wc -l`
  marks_count=$(($total_marks - ${#default_marks}))

  if [[ "$dirs_count" != "$marks_count" ]]; then
    printf '%s\n' "${default_marks[@]}" > $marks_list

    echo "$dirs" \
    | cut -d ' ' -f 2 \
    | xargs -I % bash -c 'echo "$(grep -Po "[^/]+/[^/]+$" <<< "%") : %"' \
    >> $marks_list
  fi
}

kbsel() {
  kustomize build \
    --enable-alpha-plugins \
    --enable-exec \
    $1 \
  | yq \
    -sy \
    --arg kind $2 \
    --arg name $3 \
    'map(select(.kind == $kind and .metadata.name == $name)) | first'
}

startc() {
  sudo docker run \
    --env-file .env \
    --net host \
    --init \
    --rm \
    -it \
    $@
}

gcpnv() {
  git add .
  git commit -am "$1"
  git push origin `git_current_branch` --no-verify
}

psqlv() {
  psql -Atc "$1" | wl-copy -n
}

mc() {
  mkdir -p "$1"
  cd "$1"
}

db() {
  sudo docker build -t "$1" ${@:2} .
}

pmrq() {
  pmr $(pmqq $@)
}

k() {
  kubectl $@ --cache-dir "${CACHE_DIR}/kube"
}

kc() {
  k --context "$1" ${@:2}
}

kcv() {
  kc "$1" view ${@:2}
}

kcg() {
  kc "$1" get ${@:2}
}

kcga() {
  kc "$1" get all ${@:2}
}

kcgaa() {
  kc "$1" get all --all-namespaces ${@:2}
}

kb() {
  kustomize build --load-restrictor LoadRestrictionsNone $@
}

kbj() {
  kb | yq -s
}

kka() {
  if [[ -z "$1" ]]; then
    echo "Context argument required"

    return 1
  fi

  build() {
    kb | kc "$1" apply -f - ${@:2}
  }

  if [[ -n "$2" ]]; then
    build "$1" \
      --prune \
      --prune-allowlist /v1/ConfigMap \
      --prune-allowlist /v1/Secret \
      -n "$2" \
      -l "app=${2}" \
      ${@:3}
  else
    build "$1" ${@:2}
  fi
}

kkda() {
  kka "$1" "$2" --dry-run=server
}

k9() {
  if [[ -z "$1" ]]; then
    echo "Context argument required"

    return 1
  fi

  k9s --context "$1" -A
}

tldr() {
  sudo docker run \
    --rm \
    -it \
    -v "${CACHE_DIR}/tldr:/root/.tldr/cache" \
    nutellinoit/tldr \
    $@
}

mkss() {
  mks --addons metallb,ingress,default-storageclass
}

# fzf-history-widget-accept() {
#   fzf-history-widget
#   zle accept-line
# }

# fzf_history() {
#   local selected
#   IFS=$'\n' selected=($(fc -lnr 1 | fzf --expect=ctrl-v --no-sort --height=40% --query="$BUFFER"))
#   if [[ "$selected" ]]; then
#     LBUFFER="$selected"
#     if [[ ${#selected[@]} -eq 2 ]]; then
#       LBUFFER="${selected[2]}"
#       zle accept-line
#     fi
#   fi
#   zle reset-prompt
# }
