#!/bin/bash

declare -A map

list=$(lpass ls \
  --format "%ai,%an,%ag,%al,%au" \
  | sed -r "s/^(.*)http:\/\/group//g" \
  | sed -r "/^\s*$/d" \
  | sed -r "s/\s+/###/g"
)

for item in $list; do
  IFS="," read -r -a vals <<< $item

  declare -A row=(
    [id]=${vals[0]}
    [name]=${vals[1]}
    [group]=${vals[2]}
    [url]=${vals[3]}
    [user]=${vals[4]}
  )

  if [[ -z ${row[user]} ]]; then
    if [ "${row[url]}" == "http://sn" ]; then
      row[user]="gpg/form"
    elif [ "${row[url]}" == "http://" ]; then
      row[user]="password"
    else
      row[user]="unknown"
    fi
  fi
  
  map["${row[name]//"###"/ } (${row[user]})"]=${row[id]}
done

sel=`printf "%s\n" "${!map[@]}" | wofi -S dmenu -i -p "Account" -width 1000`

if [[ -n $sel ]]; then
  pass=$(lpass show --password ${map[$sel]})

  if [ -z $pass ]; then
    pass=$(lpass show --field=Passphrase ${map[$sel]})
  fi

  echo $pass | tr -d "\n" | wl-copy
fi
