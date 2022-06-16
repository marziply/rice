# vi: ft=sh

#!/bin/zsh

marks_list="$CONFIG_DIR/marks.list"
default_marks=(
  "config : $CONFIG_DIR"
  "projects : $HOME/dev/projects"
  "work : $HOME/dev/work"
  "ops : $HOME/dev/ops"
)

start_sway() {
  current_tty="$(tty)"

  if [[ "$current_tty" =~ ^/dev/tty[0-9]+$ ]]; then
    if [[ "${current_tty: -1}" == "1" ]]; then
      exec sway
    fi
  else
    tmux source-file "$TMUX_DIR/tmux.conf"
  fi
}

generate_marks() {
  directories=$(stat $HOME/dev/{lib,work,projects}/* -c '%Y %n' | sort -r)
  directories_count=$(echo $directories | wc -l)
  default_marks_count=${#default_marks}
  total_marks_count=$(cat $marks_list | wc -l 2&>/dev/null)
  marks_count=$(($total_marks_count - $default_marks_count))

  if [ "$directories_count" != "$marks_count" ]; then
    printf '%s\n' "${default_marks[@]}" > $marks_list

    echo "$directories" \
      | cut -d ' ' -f 2 \
      | xargs -I {} bash -c 'echo "$(grep -Po "[^/]+/[^/]+$" <<< "{}") : {}"' \
      >> $marks_list
  fi
}

gcpnv() {
  git add .
  git commit -am "$1"
  git push origin "$(git_current_branch)" --no-verify
}

startc() {
  sudo docker run \
    --env-file=.env \
    --net=host \
    --init \
    --rm \
    -it \
    $@
}

psqlv() {
  psql -Atc "$1" | wl-copy -n
}

mc() {
  mkdir -p "$1"
  cd "$1"
}
