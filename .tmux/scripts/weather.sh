#!/bin/bash
#
# weather
# =======
#
# By Jezen Thomas <jezen@jezenthomas.com> Modified by John Krueger
#
# This script sends a couple of requests over the network to retrieve
# approximate location data, and the current weather for that location. This is
# useful if for example you want to display the current weather in your tmux
# status bar.

# There are three things you will need to do before using this script.
#
# 1. Install jq with your package manager of choice (homebrew, apt-get, etc.)
# 2. Sign up for a free account with OpenWeatherMap to grab your API key
# 3. Add your OpenWeatherMap API key where it says API_KEY
# 4. Stick this script somewhere in the path. I'm symlinking it into /usr/local/bin

# Set zip code here:
ZIP="NW4,GB"

set -e

# Not all icons for weather symbols have been added yet. If the weather
# category is not matched in this case statement, the command output will
# include the category ID. You can add the appropriate emoji as you go along.
#
# Weather data reference: http://openweathermap.org/weather-conditions
weather_icon() {
  case $1 in
    200) echo ⛈
      ;;
    211) echo ⛈
      ;;
    300) echo ☔️
      ;;
    301) echo ☔️
      ;;
    500) echo ☔️
      ;;
    501) echo ☔️
      ;;
    520) echo ☔️
      ;;
    521) echo ☔️
      ;;
    531) echo ☔️
      ;;
    600) echo ❄️
      ;;
    601) echo ❄️
      ;;
    602) echo ❄️
      ;;
    701) echo 🌁
      ;;
    711) echo 🔥
      ;;
    721) echo 🌁
      ;;
    741) echo 🌁
      ;;
    800) echo ☀️
      ;;
    801) echo ⛅️
      ;;
    802) echo ⛅️
      ;;
    803) echo ☁️
      ;;
    804) echo ☁️
      ;;
    *) echo "$1"
  esac
}

WEATHER=$(curl --silent http://api.openweathermap.org/data/2.5/weather\?zip="$ZIP"\&APPID=9c4c6c1b7ca7b74f2fcb873a389863a2\&units=metric)

CATEGORY=$(echo "$WEATHER" | jq .weather[0].id)
TEMP="$(echo "$WEATHER" | jq .main.temp | cut -d . -f 1)°C"
ICON=$(weather_icon "$CATEGORY")

if [[ $(uname -a) == *"Microsoft"* ]]; then
	printf "%s" "$TEMP ($ZIP)"
else
	printf "%s" "$ICON $TEMP ($ZIP)"
fi
