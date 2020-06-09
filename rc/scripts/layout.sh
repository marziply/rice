#!/bin/sh
xrandr --output DisplayPort-1 --primary --mode 2560x1440 --pos 0x339 --rotate normal --output DisplayPort-2 --off --output HDMI-A-0 --off --output DVI-D-0 --off

while [ "$#" -gt 0 ]; do
  case "$1" in
    -l|--login)
      xrandr --output DisplayPort-0 --off
    ;;
    -w|--window)
      xrandr --output DisplayPort-0 --mode 2560x1440 --pos 2560x0 --rotate left 
    ;;
  esac

  shift
done
