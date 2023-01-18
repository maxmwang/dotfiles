#!/usr/bin/env zsh

manual_update() {
  sketchybar --set $NAME label="Updating..."

  IP=$(curl -s https://ipinfo.io/ip)
  LOCATION_JSON=$(curl -s https://ipinfo.io/$IP/json)

  LOCATION="$(echo $LOCATION_JSON | jq '.city' | tr -d '"')"
  REGION="$(echo $LOCATION_JSON | jq '.region' | tr -d '"')"
  COUNTRY="$(echo $LOCATION_JSON | jq '.country' | tr -d '"')"

  # Line below replaces spaces with +
  LOCATION_ESCAPED="${LOCATION// /+}+${REGION// /+}"

  update
}

manual_update

update() {
  WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION_ESCAPED?format=j1")

  # Fallback if empty
  if [ -z $WEATHER_JSON ]; then

    sketchybar --set $NAME label=$LOCATION

    return
  fi

  # echo $WEATHER_JSON

  TEMPERATURE=$(echo $WEATHER_JSON | jq '.current_condition[0].temp_F' | tr -d '"')
  WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq '.current_condition[0].weatherDesc[0].value' | tr -d '"' | sed 's/\(.\{25\}\).*/\1.../')

  sketchybar --set $NAME label="$LOCATION  $TEMPERATURE宅 $WEATHER_DESCRIPTION"

}

case "$SENDER" in
  "mouse.clicked")
    manual_update
    ;;
  *)
    update
    ;;
esac
