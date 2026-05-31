#!/bin/bash

clock=(
    icon.drawing=off
    label.color="$LABEL_COLOR"
    label.font="$FONT:Semibold:11.0"
    update_freq=10
    padding_left=2
    padding_right=2
    script="$PLUGIN_DIR/clock.sh"
)

sketchybar --add item clock center \
           --set clock "${clock[@]}"
