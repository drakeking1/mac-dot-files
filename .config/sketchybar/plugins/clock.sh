#!/bin/sh

# Center clock: MM/DD + 12-hour time, US Mountain Time.
# America/Denver = Mountain Time (auto-handles MST/MDT daylight saving).
export TZ="America/Denver"

sketchybar --set "$NAME" label="$(date '+%m/%d | %-I:%M %p')"
