#!/bin/bash

#WORKSPACE_ICONS=("1:" "2:" "3:" "4:" "5:" "6:" "7:" "8:" "9:")
WORKSPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9")

for i in "${!WORKSPACE_ICONS[@]}"; do
    sid=$((i + 1))

    space=(
        icon="${WORKSPACE_ICONS[i]}"
        icon.font="$FONT:Bold:14.0"
        icon.padding_left=6
        icon.padding_right=2
        padding_left=3
        padding_right=3
        label.padding_right=18
        icon.highlight_color=0xffffffff
        label.color=0xff888888
        label.highlight_color=0xffffffff
        label.font="sketchybar-app-font:Regular:16.0"
        label.y_offset=-1
        background.color=0x40242424
        background.border_color=0xff444444
        background.border_width=1
        background.corner_radius=4
        script="$PLUGIN_DIR/space.sh"
        click_script="aerospace workspace $sid"
    )

    sketchybar --add item space.$sid left \
               --set space.$sid "${space[@]}" \
               --subscribe space.$sid aerospace_workspace_change front_app_switched
done
