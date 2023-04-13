#!/bin/bash

sep="|"
list=$(\
  lpass ls \
    --sync no \
    --color never \
    --format "%ai|%an|%au|%al" \
  | grep -v "http://group" \
  | column -JN "id,name,user,url" -s $sep \
  | jq '
    .table
    | map(
      setpath(
        ["user"];
        .user // 
          if .url == "http://sn" then
            "gpg"
          else
            "password"
          end
      )
    )'
)

# displays=($(xrandr --listmonitors | grep -Po '(?<=\+)XWAYLAND\d+'))
# monitor=$(swaymsg -rt get_outputs | jq 'map(.focused) | index(true)')

index=$(\
  echo $list \
  | jq -r 'map(.name + " (" + .user + ")") | .[]' \
  | tr "\n" $sep \
  | rofi \
    -dmenu \
    -i \
    -m 1 \
    -sep $sep \
    -format i
)

if [ -n "$index" ]; then
  id=$(echo $list | jq -r ".[$index].id")
else
  exit 0
fi

if [ -n "$id" ]; then
  pass=$(lpass show --sync no --password $id)

  if [ -z "$pass" ]; then
    pass=$(lpass show --sync no --field=Passphrase $id)
  fi

  echo $pass | wl-copy -n
fi
