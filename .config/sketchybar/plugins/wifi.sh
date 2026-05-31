#!/bin/bash

source "$CONFIG_DIR/colors.sh"

update() {
    IP="$(ipconfig getifaddr en0 2>/dev/null)"
    if [[ -n "$IP" ]]; then
        ICON="􀙇"
        COLOR="$WHITE"
    else
        ICON="􀙈"
        COLOR="$GREY"
    fi
    sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR"
}

mouse_clicked() {
    IP="$(ipconfig getifaddr en0 2>/dev/null)"
    SSID="$(networksetup -getairportnetwork en0 2>/dev/null | sed 's/Current Wi-Fi Network: //')"

    sketchybar --set wifi.ssid label="${SSID:-Not connected}"
    sketchybar --set wifi.ip label="${IP:-—}"
    sketchybar --set "$NAME" popup.drawing=toggle
}

case "$SENDER" in
    mouse.clicked) mouse_clicked ;;
    mouse.exited.global) sketchybar --set "$NAME" popup.drawing=off ;;
    *) update ;;
esac
