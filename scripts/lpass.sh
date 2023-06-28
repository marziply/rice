#!/bin/bash

get_pw() {
  lpass show --sync no ${@:2} $1
}

list_pw() {
  lpass ls --sync no --color never --format "%ai|%an|%au|%al" \
  | grep -v "http://group" \
  | column -JN "id,name,user,url" -s "|" \
  | jq -f "${SCRIPTS_DIR}/assets/lpass.jq"
}

get_id() {
  local list=`list_pw`

  jq -r 'map("\(.name) (\(.user))") | .[]' <<< $list \
  | rofi -dmenu -i -format i -theme "windows/lpass" \
  | jq -r --argjson list "$list" '. as $i | $list[$i].id'
}

id=`get_id`

if [[ -n "$id" ]]; then
  pass=`get_pw --password $id`

  if [[ -z "$pass" ]]; then
    pass=`get_pw --field=Passphrase $id`
  fi

  wl-copy -no $pass
fi
