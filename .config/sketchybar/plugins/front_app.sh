#!/usr/bin/env zsh

# echo $INFO

ICON_PADDING_RIGHT=10

case $INFO in
  "Safari")
    ICON_PADDING_RIGHT=10
    ICON=
    ;;
  "kitty")
    ICON_PADDING_RIGHT=8
    ICON=
    ;;
  "Code")
    ICON_PADDING_RIGHT=6
    ICON=
    ;;
  "Calendar")
    ICON_PADDING_RIGHT=8
    ICON=
    ;;
  "Discord")
    ICON=ﭮ
    ;;
  "FaceTime")
    ICON_PADDING_RIGHT=11
    ICON=
    ;;
  "Finder")
    ICON=
    ;;
  "Google Chrome")
    ICON_PADDING_RIGHT=7
    ICON=
    ;;
  "Messages")
    ICON=
    ;;
  "Notion")
    ICON_PADDING_RIGHT=12
    ICON=
    ;;
  "Spotify")
    ICON=
    ;;
  "Slack")
    ICON=
    ;;
  *)
    ICON=﯂
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
