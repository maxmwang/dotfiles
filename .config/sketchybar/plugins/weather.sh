#!/usr/bin/env zsh

update() {
  sketchybar --set $NAME label="Updating..."

  IP=$(curl -s https://ipinfo.io/ip)
  LOCATION_JSON=$(curl -s https://ipinfo.io/$IP/json)

  LOCATION="$(echo $LOCATION_JSON | jq '.city' | tr -d '"')"
  COORDINATES="$(echo $LOCATION_JSON | jq '.loc' | tr -d '"')"
  GRID_LINK="$(curl -s https://api.weather.gov/points/$COORDINATES | jq '.properties.forecastGridData' | tr -d '"')"

  # echo $GRID_LINK

  WEATHER_JSON="$(curl -s $GRID_LINK/forecast | jq '.properties.periods[0]')"

  # Fallback if empty
  if [ -z $WEATHER_JSON ]; then
    sketchybar --set $NAME label=$LOCATION

    return
  fi

  # echo $WEATHER_JSON

  TEMPERATURE=$(echo $WEATHER_JSON | jq '.temperature' | tr -d '"')
  WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq '.shortForecast' | tr -d '"' | sed 's/\(.\{25\}\).*/\1.../')

  sketchybar --set $NAME label="$LOCATION  $TEMPERATURE宅 $WEATHER_DESCRIPTION"
}

case "$SENDER" in
  *)
    echo "update"
    update
    ;;
esac
