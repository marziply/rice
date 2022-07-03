#!/bin/bash

all_workspaces=$(swaymsg -rt get_workspaces)
focused_w=$(echo $all_workspaces | jq -c '.[] | select(.focused)')

monitors=$(\
  xrandr --listmonitors \
  | awk '/\s[0-2]/ { gsub("(/[0-9]+|)(x|+)", ":", $3); print $3, $4 }'
)
focused_m=$(\
  swaymsg -rt get_outputs \
  | jq '.[] | select(.focused).rect | .width, .height, .x, .y | tostring' \
  | jq -rs 'join(":")'
)

while [ -n "$1" ]; do
  case "$1" in
    index)
      echo $focused_w | jq '.num'
    ;;
    name)
      echo $focused_w | jq -r '.name'
    ;;
    monitor)
      echo "${monitors[@]}" | awk -v F=$focused_m '$1 == F { print $NF }'
    ;;
  esac

  shift
done
