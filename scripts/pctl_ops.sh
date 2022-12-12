#!/bin/bash

device() {
  player=$(playerctl -l | grep "spotifyd")

  if [[ $? -eq 0 ]]; then
    player=$(echo $player | head -n 1)
  else
    player=$(playerctl -l | head -n 1)
  fi

  echo $player
}

play_pause_status() {
  dbus-send \
    --print-reply \
    --dest="org.mpris.MediaPlayer2.spotifyd" \
    /org/mpris/MediaPlayer2 \
    org.freedesktop.DBus.Properties.Get \
    string:'org.mpris.MediaPlayer2.Player' \
    string:'PlaybackStatus' \
    | tail -1 \
    | cut -b 25- \
    | tr -d '"'
}

declare -A map=(
  [Playing]="Pause"
  [Paused]="Play"
)

case "${1:-}" in
  next)
    op="Next"
    ;;
  previous)
    op="Previous"
    ;;
  play)
    op="Play"
    ;;
  pause)
    op="Pause"
    ;;
  play-pause)
    op="${map[$(play_pause_status)]}"
    ;;
  *)
    echo "Usage: $0 next|previous|play|pause|play-pause"

    exit 1
    ;;
esac

dbus-send \
  --print-reply \
  --dest="org.mpris.MediaPlayer2.$(device)" \
  /org/mpris/MediaPlayer2 \
  "org.mpris.MediaPlayer2.Player.$op"
