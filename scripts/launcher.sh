#!/bin/bash

source $ZSH_DIR/env.zsh

displays=($(xrandr --listmonitors | grep -Po '(?<=\+)XWAYLAND\d+'))
index=$(swaymsg -rt get_outputs | jq 'map(.focused) | index(true)')

rofi -show drun -m ${displays[$index]} $@
