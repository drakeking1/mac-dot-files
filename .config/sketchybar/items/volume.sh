#!/bin/bash

volume=(
    icon="􀊪"
    label.font="$FONT:Semibold:12.0"
    icon.padding_right=4
    label.padding_left=4
    padding_left=2
    padding_right=8
    script="$PLUGIN_DIR/volume.sh"
)

sketchybar --add item volume right \
           --set volume "${volume[@]}" \
           --subscribe volume volume_change mouse.clicked mouse.exited.global

# Popup: current volume label
sketchybar --add item volume.level popup.volume \
           --set volume.level \
               icon="􀊪" \
               label="—%" \
               background.drawing=off

# Popup: controls
sketchybar --add item volume.up popup.volume \
           --set volume.up \
               icon="􀊩" \
               label="Volume Up" \
               click_script="osascript -e 'set volume output volume ((output volume of (get volume settings)) + 10)'; sketchybar --trigger volume_change"

sketchybar --add item volume.down popup.volume \
           --set volume.down \
               icon="􀊨" \
               label="Volume Down" \
               click_script="osascript -e 'set volume output volume ((output volume of (get volume settings)) - 10)'; sketchybar --trigger volume_change"

sketchybar --add item volume.mute popup.volume \
           --set volume.mute \
               icon="􀊦" \
               label="Toggle Mute" \
               click_script="osascript -e 'set volume with output muted (not (output muted of (get volume settings)))'; sketchybar --trigger volume_change"

sketchybar --add item volume.prefs popup.volume \
           --set volume.prefs \
               icon="􀍟" \
               label="Sound Settings..." \
               icon.color="$GREY" \
               click_script="sketchybar --set volume popup.drawing=off; open '/System/Library/PreferencePanes/Sound.prefPane'"

status_bracket=(
    background.color="$BACKGROUND_1"
    background.border_color="$BACKGROUND_2"
)

sketchybar --add bracket status volume battery wifi \
           --set status "${status_bracket[@]}"
