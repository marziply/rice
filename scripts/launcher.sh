#!/bin/bash

source $ZSH_DIR/env.zsh

monitor=$(swaymsg -rt get_outputs | jq 'map(.focused) | index(true)')

# rofi -show drun -m "$($SCRIPTS_DIR/focused_display.sh monitor)" $@
rofi -show drun -m "XWAYLAND${monitor}" $@
