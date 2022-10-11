#!/bin/bash

source $ZSH_DIR/env.zsh

rofi -show drun -m "$($SCRIPTS_DIR/focused_display.sh monitor)"
