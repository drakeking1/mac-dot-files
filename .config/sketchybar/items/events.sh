#!/bin/bash

events=(
    icon.font="$ICON_FONT:Regular:16.0"
    update_freq=30
    padding_left=8
    padding_right=8
    script="$PLUGIN_DIR/events.sh"
)

sketchybar --add item events right \
           --set events "${events[@]}" \
           --subscribe events mouse.clicked
