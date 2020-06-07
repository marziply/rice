layouts="$(ls $XDG_CONFIG_HOME/i3/layouts)"
array=($(echo $layouts | grep -o "[0-9]" | uniq))

for i in "${array[@]}"; do
  i3-resurrect restore -w $i -d $XDG_CONFIG_HOME/i3/layouts
done

notify-send "Restored layouts" $nums
