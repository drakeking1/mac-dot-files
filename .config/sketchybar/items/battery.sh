#!/bin/bash

battery=(
    icon.font="$ICON_FONT:Regular:15.0"
    updates=on
    update_freq=120
    icon.padding_right=4
    label.padding_left=4
    padding_left=2
    padding_right=8
    script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
