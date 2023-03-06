#!/usr/bin/env zsh

source "$HOME/.config/sketchybar/colors.sh"

update_space() {
  SPACE_ID=$(echo "$INFO" | jq -r '."display-1"')

  case $SPACE_ID in
    1)
      ICON=
      ICON_PADDING=7
      ;;
    *)
      ICON=$SPACE_ID
      ICON_PADDING=10
      ;;
  esac

  sketchybar --set $NAME \
    icon=$ICON \
    icon.padding_left=$ICON_PADDING \
    icon.padding_right=$ICON_PADDING
}

update_color() {
  SPACE_TYPE=$(yabai -m query --spaces --space | jq ".type")

  case $SPACE_TYPE in
    "\"stack\"")
      COLOR=$PEACH
      ;;
    *)
      COLOR=$MAUVE
      ;;
  esac

  sketchybar --set $NAME background.color=$COLOR
}

case "$SENDER" in
  "mouse.clicked")
    open "x-apple.systempreferences:com.apple.preference"
    ;;
  "space_change")
    update_space
    update_color
    ;;
  *)
    update_color
    ;;
esac
