#!/bin/bash

# Base Colors (Untouched)
export PURE_WHITE=0xffffffff
export PURE_BLACK=0xff000000
export TRANSPARENT=0x00000000

### Tokyo Night Storm
export BLACK=0xff1a1b26      # bg_dark
export WHITE=0xffc0caf5      # fg
export RED=0xfff7768e        # red
export GREEN=0xff9ece6a      # green
export BLUE=0xff7aa2f7        # blue
export YELLOW=0xffe0af68      # yellow
export ORANGE=0xffff9e64     # orange
export MAGENTA=0xffbb9af7    # magenta
export GREY=0xff565f89        # comment

# Backgrounds with transparency
export BG0=0xff24283b        # bg
export BG1=0x603b4261        # bg_highlight (with transparency)
export BG2=0x60414868        # bg_status (with transparency)

# Accent Colors
export ACCENT_COLOR=$BLUE

# Battery Colors (using the new palette)
export BATTERY_1=$GREEN
export BATTERY_2=$YELLOW
export BATTERY_3=$ORANGE
export BATTERY_4=$RED
export BATTERY_5=$RED

# General bar colors (using the new variables)
export BAR_COLOR=$BG0
export BAR_BORDER_COLOR=$BG2
export BACKGROUND_1=$BG1
export BACKGROUND_2=$BG2
export ICON_COLOR=$WHITE # Color of all icons
export LABEL_COLOR=$WHITE # Color of all labels
export POPUP_BACKGROUND_COLOR=$BAR_COLOR
export POPUP_BORDER_COLOR=$WHITE
export SHADOW_COLOR=$BLACK
