#!/bin/bash

key=$1
actions=(shrink grow)
container=$(
  swaymsg -rt get_tree \
    | jq "
      recurse(.nodes[])
      | select(any(.nodes[]; .focused))
      | .nodes
    "
)
last=$(jq -j 'last | .id' <<< $container)
focused=$(jq -j '.[] | select(.focused) | .id' <<< $container)

action_name() {
  if [ $last -eq $focused ]; then
    if [ $1 -gt 0 ]; then
      action_value 1
    else
      action_value 0
    fi
  else
    if [ $1 -gt 0 ]; then
      action_value 0
    else
      action_value 1
    fi
  fi
}

action_value() {
  if [ $1 -gt 0 ]; then
    echo "shrink"
  else
    echo "grow"
  fi
}

action_arg() {
  case "$key" in
    h)
      echo $(action_name 0)
      ;;
    l)
      echo $(action_name 1)
      ;;
    k)
      echo $(action_name 0)
      ;;
    j)
      echo $(action_name 1)
      ;;
  esac
}

side_arg() {
  case "$key" in
    h|l)
      echo "width"
    ;;
    j|k)
      echo "height"
    ;;
  esac
}

swaymsg resize $(action_arg) $(side_arg) 60px
