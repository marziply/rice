#!/bin/bash

monitors=$(\
  xrandr --listmonitors \
  | awk '/\s[0-2]/ { gsub("(/[0-9]+|)(x|+)", ":", $3); print $3, $4 }'
)
workspace=$(\
  swaymsg -rt get_workspaces \
  | jq -c '.[] | select(.focused)'
)
display=$(\
  swaymsg -rt get_outputs \
  | jq '.[] | select(.focused).rect | .width, .height, .x, .y | tostring' \
  | jq -rs 'join(":")'
)

while [ -n "$1" ]; do
  case "$1" in
    index)
      echo $workspace | jq '.num'
    ;;
    name)
      echo $workspace | jq -r '.name'
    ;;
    monitor)
      echo "${monitors[@]}" | awk -v F=$display '$1 == F { print $NF }'
    ;;
  esac

  shift
done
