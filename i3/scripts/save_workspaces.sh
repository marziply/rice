ws=$(i3-msg -t get_workspaces)
json=$(jq -c -S 'map(.num)|sort' <<< $ws)
nums=${json:1:-1}
array=(${nums//,/ })

rm -rf $XDG_CONFIG_HOME/i3/layouts/*

for i in ${array[@]}; do
  i3-resurrect save -w $i -d $XDG_CONFIG_HOME/i3/layouts
done

notify-send "Saved layouts" "\n${nums//,/, }"
