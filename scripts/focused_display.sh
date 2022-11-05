#!/bin/bash

displays=($(xrandr --listmonitors | grep -Po '(?<=\+)XWAYLAND\d+'))
index=$(swaymsg -rt get_outputs | jq 'map(.focused) | index(true)')

while [ -n "$1" ]; do
  case "$1" in
    index)
      echo -ne $index
    ;;
    name)
      echo -ne "${displays[$index]}"
    ;;
  esac

  shift
done
