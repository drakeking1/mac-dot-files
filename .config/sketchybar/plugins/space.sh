#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Extract workspace number from item name (e.g. "space.1" -> "1")
WORKSPACE="${NAME#space.}"

update() {
    FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

    if [ "$WORKSPACE" = "$FOCUSED" ]; then
        COLOR=0xffffffff
        ICON_HIGHLIGHT=on
    else
        COLOR=0xff444444
        ICON_HIGHLIGHT=off
    fi

    # Build app icon strip from windows in this workspace
    icon_strip=" "
    apps=$(aerospace list-windows --workspace "$WORKSPACE" --format '%{app-name}' 2>/dev/null)
    if [ -n "$apps" ]; then
        while IFS= read -r app; do
            icon_strip+=" $("$CONFIG_DIR"/plugins/icon_map.sh "$app")"
        done <<< "$apps"
    else
        icon_strip=" —"
    fi

    sketchybar --set "$NAME" \
        icon.highlight="$ICON_HIGHLIGHT" \
        label.highlight="$ICON_HIGHLIGHT" \
        background.border_color="$COLOR" \
        label="$icon_strip"
}

update
