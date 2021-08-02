#!/bin/bash

input=$(\
  rofi \
  -dmenu \
  -p "Password length" \
  -width 300 \
  -lines 0 \
)
len=$(echo | $input)

pwgen -ys1 $((len)) | tr -d "\n" | xclip -sel clip
