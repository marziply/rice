# vi: ft=sh

#!/bin/zsh

gcpnv() {
  git add .
  git commit -am "$1"
  git push origin "$(git_current_branch)" --no-verify
}

request() {
  /usr/bin/http \
    -jb \
    --check-status \
    "$1" \
    "$2" \
    "Authorization:Bearer DEV_TOKEN" \
    "${@:3}"
}

api_request() {
  red=`tput setaf 1`
  method=$1
  url=$2

  shift 2

  result=$(request "$method" ":3000/api/$url" $@)

  if [[ $? -ge 4 ]]; then
    echo $red

    jq .message -r <<< $result
  else
    jq <<< $result
  fi
}

get() {
  api_request GET $@
}

put() {
  api_request PUT $@
}

post() {
  api_request POST $@
}

del() {
  api_request DELETE $@
}

startc() {
  sudo docker run \
    --env-file=.env \
    --net=host \
    --init \
    --rm \
    -it \
    $@
}

psqlv() {
  psql -Atc "$1" | wl-copy -n
}
