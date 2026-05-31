#!/bin/bash
# Control the system "now playing" media — YouTube, YouTube Music, web video,
# Music, Spotify, etc. — by simulating the hardware media keys.
# Built-in only: uses osascript (JavaScript/ObjC bridge), no extra tools.

ACTION="$1"

case "$ACTION" in
    prev)      KEYCODE=18 ;;  # NX_KEYTYPE_PREVIOUS
    playpause) KEYCODE=16 ;;  # NX_KEYTYPE_PLAY
    next)      KEYCODE=17 ;;  # NX_KEYTYPE_NEXT
    *) exit 0 ;;
esac

osascript -l JavaScript <<JXA
ObjC.import('AppKit');
ObjC.import('CoreGraphics');
function tap(keyCode, down) {
  var state = down ? 0xA : 0xB;
  var flags = down ? 0xA00 : 0xB00;
  var data1 = (keyCode << 16) | (state << 8);
  var ev = \$.NSEvent.otherEventWithTypeLocationModifierFlagsTimestampWindowNumberContextSubtypeData1Data2(
    14, \$.NSMakePoint(0,0), flags, 0, 0, \$(), 8, data1, -1);
  \$.CGEventPost(0, ev.CGEvent);
}
tap($KEYCODE, true);
tap($KEYCODE, false);
JXA

# Locally flip the play/pause glyph so the button reflects toggling.
if [ "$ACTION" = "playpause" ]; then
    STATE_FILE="/tmp/sketchybar_media_playing"
    if [ -f "$STATE_FILE" ]; then
        rm -f "$STATE_FILE"
        sketchybar --set media.playpause icon="􀊃"   # play.fill  (now paused)
    else
        touch "$STATE_FILE"
        sketchybar --set media.playpause icon="􀊆"   # pause.fill (now playing)
    fi
fi
