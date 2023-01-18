#!/usr/bin/env zsh

MAIN_DISPLAY=$(system_profiler SPDisplaysDataType | grep -B 3 'Main Display:' | awk '/Display Type/ {print $3}')

if [ -z $MAIN_DISPLAY ]; then
    sketchybar --set weather background.padding_right=2
    sketchybar --set spotify background.padding_left=2
    sketchybar --bar padding_left=3 padding_right=3
fi
