#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [[ $FOCUSED_WORKSPACE != "" ]]; then
  sketchybar --set $NAME label="􀏜 $FOCUSED_WORKSPACE |"
else
  sketchybar --set $NAME label="􀏜 $1 |"
fi
