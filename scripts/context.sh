#!/bin/bash

kubectl config get-contexts -o name \
| rofi -dmenu -theme "windows/context" \
| xargs -I % kubectl config use-context %
