#!/bin/bash

toggle_output() {
  swaymsg output "DP-${1}" dpms toggle
}

toggle_vertical_displays() {
  toggle_output 2
  toggle_output 3
}

toggle_vertical_displays

trap "toggle_vertical_displays" SIGUSR1

swaylock -Fetc '#000000'

toggle_vertical_displays
