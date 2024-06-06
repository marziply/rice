#!/bin/bash

mode="$1"
now=$(date +%Y%m%d%H%M%S)
output="${HOME}/${now}.png"
display=$(\
 swaymsg -t get_outputs \
 | jq -r '.[] | select(.focused) | .name' \
)

shift

notify() {
  title="Captured $1"

  if [ "$mode" = "clip" ]; then
    notify-send "$title" "Copied to clipboard"
  elif [ -e "$output" ]; then
    notify-send "$title" "Saved as ${now}.png"
  fi
}

window() {
  if [ "$mode" = "clip" ]; then
    grim -o "$display" - | wl-copy
  fi

  if [ "$mode" = "save" ]; then
    grim -o "$display" "$output"
  fi

  notify "window"
}

area() {
  if [ "$mode" = "clip" ]; then
    grim -g "$(slurp)" - | wl-copy
  fi

  if [ "$mode" = "save" ]; then
    grim -g "$(slurp)" "$output"
  fi

  notify "area"
}

"$@"
