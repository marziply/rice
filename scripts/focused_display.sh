#!/bin/bash

outputs=$(swaymsg -rt get_workspaces)
focused=$(echo $outputs | jq -c '.[] | select(.focused)')

index() {
  echo $focused | jq '.output[-1:] | tonumber -1'
}

while [ -n "$1" ]; do
  case "$1" in
    index)
      index
    ;;
    name)
      echo $focused | jq -r '.name'
    ;;
    monitor)
      echo "XWAYLAND$(index)"
    ;;
  esac

  shift
done
