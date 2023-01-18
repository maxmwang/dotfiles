#!/usr/bin/env zsh

echo $INFO

case ${INFO} in
  [6-9][0-9]|100)
    ICON=""
    ICON_PADDING_RIGHT=5
    ;;
  [1-5][0-9]|[1-9])
    ICON=""
    ICON_PADDING_RIGHT=11
    ;;
  *)
    ICON="ﱝ"
    ICON_PADDING_RIGHT=9
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT

case "$SENDER" in
  "mouse.clicked")
    osascript -e 'set volume output muted not (output muted of (get volume settings))'
esac