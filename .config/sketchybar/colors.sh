#!/bin/bash

### Pure black & white theme ###
# Everything is black, white, or a shade of grey. All "accent" colors are
# mapped to white so any item that references them stays monochrome.

export BLACK=0xff000000
export WHITE=0xffffffff
export GREY=0xff888888        # dim text / secondary

# Accent colors -> white (keeps the palette strictly black & white)
export RED=0xffffffff
export GREEN=0xffffffff
export BLUE=0xffffffff
export YELLOW=0xffffffff
export ORANGE=0xffffffff
export MAGENTA=0xffffffff

export TRANSPARENT=0x00000000

# Greyscale backgrounds
export BG0=0xff000000         # bar background — pure black
export BG1=0x40242424         # item background — subtle dark fill
export BG2=0xff444444         # borders / dividers

# General bar colors
export BAR_COLOR=$BG0
export BAR_BORDER_COLOR=$BG2
export BACKGROUND_1=$BG1
export BACKGROUND_2=$BG2
export ICON_COLOR=$WHITE      # Color of all icons
export LABEL_COLOR=$WHITE     # Color of all labels
export POPUP_BACKGROUND_COLOR=$BG0
export POPUP_BORDER_COLOR=$WHITE
export SHADOW_COLOR=$BLACK
