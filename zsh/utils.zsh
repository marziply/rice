#!/bin/zsh

marks_list="${CONFIG_DIR}/marks.list"
default_marks=(
  "config : ${CONFIG_DIR}"
  "lab : ${HOME}/dev/lab"
  "projects : ${HOME}/dev/projects"
  "work : ${HOME}/dev/work"
)

start_sway() {
  local current_tty="$(tty)"

  if [[ "$current_tty" =~ ^/dev/tty[0-9]+$ ]]; then
    if [[ "${current_tty: -1}" == "1" ]]; then
      sway
    fi
  elif [[ -z "$SSH_CLIENT" && -z "$SSH_TTY" ]]; then
    tmux source-file "${TMUX_DIR}/tmux.conf"
  fi

  # if ! systemctl -q is-active libvirtd.service; then
  #   systemctl -q start libvirtd.service
  # fi
}

generate_marks() {
  dirs=$(find $HOME/* -maxdepth 2 -type d)
  dirs_count=$(echo $dirs | wc -l)
  total_marks=$(cat $marks_list | wc -l)
  marks_count=$(($total_marks - ${#default_marks}))

  if [[ "$dirs_count" != "$marks_count" ]]; then
    printf '%s\n' "${default_marks[@]}" >$marks_list

    echo "$dirs" |
      cut -d ' ' -f 2 |
      xargs -I % bash -c 'echo "$(grep -Po "[^/]+/[^/]+$" <<< "%") : %"' \
        >>$marks_list
  fi
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
  git push origin $(git_current_branch) --no-verify
}

pgcp() {
  psql -Atc "$1" | wl-copy -n
}

db() {
  sudo docker build -t "$1" ${@:2} .
}

tldr() {
  sudo docker run \
    --rm \
    -it \
    -v "${CACHE_DIR}/tldr:/root/.tldr/cache" \
    nutellinoit/tldr \
    $@
}
