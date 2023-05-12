#!/bin/bash

WEATHER=$(curl -sf 'https://wttr.in/Bloomington,Minnesota,United%20States?format=%C,%t&lang=en')
#read -r CONDITION TEMPERATURE <<< "$WEATHER"

#case $CONDITION in
#  Clear) ICON="杖";;
#  Cloudy|Overcast) ICON="摒";;
#  Foggy|Mist) ICON="敖";;
#  Rain|Drizzle) ICON="殺";;
#  Snow|Sleet|Hail) ICON="流";;
#  Thunderstorm) ICON="朗";;
#  *) ICON="墳";;
#esac

#echo "${ICON} ${TEMPERATURE}"

# Parse the temperature and condition from the weather information
TEMP=$(echo "$WEATHER" | awk -F',' '{print $2}')
COND=$(echo "$WEATHER" | awk -F',' '{print $1}')

# Display the appropriate weather icon using JetBrains Mono NF font
case "$COND" in
  "Clear")    ICON="";; # sunny
  "Partly cloudy")    ICON="";; # partly cloudy
  "Cloudy")   ICON="";; # cloudy
  "Mist"|"Fog")   ICON="";; # foggy
  "Rain"|"Drizzle")  ICON="";; # rainy
  "Thunderstorm")    ICON="";; # thunderstorm
  "Snow"|"Freezing rain"|"Ice pellets")   ICON="";; # snowy
  *)  ICON="";; # default to partly cloudy
esac

# Display the temperature and weather icon
echo "$ICON $TEMP"
