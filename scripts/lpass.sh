#!/bin/bash

sep="|"
list=$(\
  lpass ls \
    --sync no \
    --color never \
    --format "%ai|%an|%au|%al" \
  | grep -v "http://group" \
  | column -JN "id,name,user,url" -s $sep \
  | jq '.table'
)
index=$(\
  echo $list \
  | jq -r 'map(.name + " (" + .user + ")") | .[]' \
  | tr "\n" $sep \
  | rofi \
    -dmenu \
    -i \
    -m "$($SCRIPTS_DIR/focused_display.sh monitor)" \
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
