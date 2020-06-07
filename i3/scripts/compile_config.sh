#!/bin/bash

cd $XDG_CONFIG_HOME/i3/config.d

rm ../config

for i in *.i3.config; do
  echo "### $i ###" >> ../config
  echo >> ../config

  cat $i >> ../config

  echo >> ../config
done

i3 restart

notify-send "i3" "Config compiled"
