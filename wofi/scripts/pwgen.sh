#!/bin/bash

len=$(echo |\
  rofi \
  -dmenu \
  -p "Password length" \
  -width 300 \
  -lines 0 \
)

pwgen -ys1 $((len)) | tr -d "\n" | xclip -sel clip
