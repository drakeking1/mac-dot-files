#!/bin/bash

get_volume_icon() {
    local vol=$1
    local muted=$2
    if [[ "$muted" == "true" ]] || [[ "$vol" == "0" ]]; then
        echo "􀊦"
    elif [[ "$vol" -lt 33 ]]; then
        echo "􀊨"
    elif [[ "$vol" -lt 67 ]]; then
        echo "􀊩"
    else
        echo "􀊪"
    fi
}

update() {
    VOLUME=$(osascript -e "output volume of (get volume settings)")
    MUTED=$(osascript -e "output muted of (get volume settings)")
    ICON=$(get_volume_icon "$VOLUME" "$MUTED")

    if [[ "$MUTED" == "true" ]]; then
        sketchybar --set "$NAME" icon="$ICON" label="Muted" icon.color="$GREY"
    else
        sketchybar --set "$NAME" icon="$ICON" label="${VOLUME}%" icon.color="$WHITE"
    fi

    sketchybar --set volume.level label="${VOLUME}%"
}

mouse_clicked() {
    sketchybar --set "$NAME" popup.drawing=toggle
}

source "$CONFIG_DIR/colors.sh"

case "$SENDER" in
    volume_change) update ;;
    mouse.clicked) mouse_clicked ;;
    mouse.exited.global) sketchybar --set "$NAME" popup.drawing=off ;;
    *) update ;;
esac
