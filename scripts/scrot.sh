#!/bin/bash

mode="$1"
now=$(date +%Y%m%d%H%M%S)
display=$(\
 swaymsg -t get_outputs \
 | jq -r '.[] | select(.focused) | .name' \
)

if [ "$mode" = "clip" ]; then
  output="-"
fi

if [ "$mode" = "save" ]; then
  output="${HOME}/${now}.png"
fi

shift

notify() {
  title="Captured $1"

  if [ "$output" = "-" ]; then
    notify-send "$title" "Copied to clipboard"
  elif [ -e "$output" ]; then
    notify-send "$title" "Saved as ${now}.png"
  fi
}

window() {
  grim -o "$display" "$output"

  notify "window"
}

area() {
  grim -g "$(slurp)" "$output"

  notify "area"
}

"$@"
