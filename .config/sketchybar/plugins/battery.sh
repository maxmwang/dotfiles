#!/usr/bin/env zsh

source "$HOME/.config/sketchybar/colors.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
PLUGGED_IN=$(pmset -g batt | grep 'AC attached')
CHARGING=$(pmset -g batt | grep ' charging;')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  [8-9][0-9]|100)
    ICON=""
    ICON_COLOR=$GREEN
    ;;
  [6-7][0-9])
    ICON=""
    ICON_COLOR=$GREEN
    ;;
  [4-5][0-9])
    ICON=""
    ICON_COLOR=$YELLOW
    ;;
  [2-3][0-9])
    ICON=""
    ICON_COLOR=$PEACH
    ;;
  1[0-9]|[0-9])
    ICON=""
    ICON_COLOR=$RED
    ;;
esac

if [[ $PLUGGED_IN != "" ]]; then
  ICON=""
  ICON_COLOR=$YELLOW
elif [[ $CHARGING != "" ]]; then
  ICON=""
fi

sketchybar --set $NAME icon=$ICON label="${PERCENTAGE}%" icon.color=${ICON_COLOR}
