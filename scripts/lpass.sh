#!/bin/bash

get_record() {
  lpass show --sync no ${@:1:$#-1} ${@:$#}
}

get_password() {
  pass=`get_record --password $1`

  if [[ -z "$pass" ]]; then
    get_record --field=Passphrase $1
  else
    echo $pass
  fi
}

list_records() {
  lpass ls --sync no --color never --format "%ai|%an|%au|%al" \
  | grep -v "http://group" \
  | column -JN "id,name,user,url" -s "|" \
  | jq -f "${SCRIPTS_DIR}/assets/lpass.jq"
}

get_id() {
  local list=`list_records`

  jq -r 'map("\(.name) (\(.user))") | .[]' <<< $list \
  | rofi -dmenu -i -format i -theme "windows/lpass" \
  | jq -r --argjson list "$list" '. as $i | $list[$i].id'
}

id=`get_id`

if [[ -n "$id" ]]; then
  case "$1" in
    passwords)
      output=`get_password $id`
    ;;
    notes)
      output=`get_record --notes $id`
    ;;
  esac

  wl-copy -n $output
fi
