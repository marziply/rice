#!/bin/bash

display="HDMI-A-1"
active=$(swaymsg -rt get_outputs | jq ".[] | select(.name == \"$display\") | .active")
toggle=$([[ $active == true ]] && echo "disable" || echo "enable")

swaymsg output $display $toggle
