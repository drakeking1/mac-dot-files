#!/bin/bash

wifi=(
    icon="􀙇"
    label.drawing=off
    padding_left=4
    padding_right=4
    script="$PLUGIN_DIR/wifi.sh"
)

sketchybar --add item wifi right \
           --set wifi "${wifi[@]}" \
           --subscribe wifi wifi_change mouse.clicked mouse.exited.global

# Popup items
sketchybar --add item wifi.ssid popup.wifi \
           --set wifi.ssid \
               icon="􀙇" \
               label="—" \
               background.drawing=off

sketchybar --add item wifi.ip popup.wifi \
           --set wifi.ip \
               icon="􀤆" \
               label="—" \
               background.drawing=off

sketchybar --add item wifi.prefs popup.wifi \
           --set wifi.prefs \
               icon="􀍟" \
               label="Network Settings..." \
               icon.color="$GREY" \
               click_script="sketchybar --set wifi popup.drawing=off; open '/System/Library/PreferencePanes/Network.prefPane'"
