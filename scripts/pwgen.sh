#!/bin/bash

title="Password length"
len=$(\
  rofi \
    -dmenu \
    -m $($SCRIPTS_DIR/focused_display.sh monitor) \
    -p "$title" \
    -l 0
)

pwgen -ys1 $len | wl-copy -n
