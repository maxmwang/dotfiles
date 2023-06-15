#!/usr/bin/env zsh

source "$HOME/.config/sketchybar/colors.sh"

ID="64-03-7f-f6-e7-f0"
CONNECTED=$(blueutil --is-connected $ID)

BORDER=0

update() {
  if [ $CONNECTED = "1" ]; then
    ICON="󰂱"
    ICON_PADDING=8
    BORDER=1
  else
    ICON=""
    ICON_PADDING=10
  fi

  sketchybar --set $NAME \
                icon=$ICON \
                icon.color=$BLUE \
                icon.padding_left=$ICON_PADDING \
                icon.padding_right=$ICON_PADDING \
                background.drawing=on \
                background.border_color=$MAUVE \
                background.border_width=$BORDER
}

case "$SENDER" in
  "mouse.clicked")
    if [ $CONNECTED = "1" ]; then
      blueutil --disconnect $ID
    else
      blueutil --connect $ID
    fi
    update
    ;;
  *)
    update
    ;;
esac
