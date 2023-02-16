#!/usr/bin/env zsh

source "$HOME/.config/sketchybar/colors.sh"

update() {
  PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
  PLUGGED_IN=$(pmset -g batt | grep 'AC attached')
  CHARGING=$(pmset -g batt | grep ' charging;')

  if [ $PERCENTAGE = "" ]; then
    exit 0
  fi

  BORDER=0

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
    ICON_COLOR=$RED
    sketchybar --set $NAME icon=$ICON label="${PERCENTAGE}%" icon.color=${ICON_COLOR}
    sleep 1
    update
    return
  elif [[ $CHARGING != "" ]]; then
    ICON=""
    BORDER=1
  fi

  sketchybar --set $NAME \
                icon=$ICON \
                icon.color=${ICON_COLOR} \
                label="${PERCENTAGE}%" \
                background.drawing=on \
                background.border_color=$MAUVE \
                background.border_width=$BORDER
}

case "$SENDER" in
  *)
    update
    ;;
esac
