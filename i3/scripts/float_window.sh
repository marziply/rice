win=$(i3-msg -t get_tree | jq 'recurse(.nodes[]) | select(.focused == true) | .')

if [[ -z $win ]]; then
  i3-msg floating disable, focus up, kill window
else
  i3-msg splitv open, focus up, floating enable
fi
