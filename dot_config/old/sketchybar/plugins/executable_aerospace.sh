#!/usr/bin/env bash

#!/usr/bin/env bash
# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh
source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/plugins/icon_map_fn.sh"

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused --format "%{workspace}")

if [ "$SENDER" == "mouse.entered" ]; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    exit 0
  fi
  sketchybar --set "$NAME" \
    background.drawing=on \
    label.color="$LABEL_COLOR" \
    background.color="$PURE_BLACK"
  exit 0
fi

if [ "$SENDER" == "mouse.exited" ]; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    exit 0
  fi
  sketchybar --set "$NAME" \
    background.drawing=off \
    label.color="$LABEL_COLOR" \
    background.color="$PURE_BLACK"
  exit 0
fi

icons=""
# Get the windows information as JSON for better parsing
APPS_JSON=$(aerospace list-windows --workspace "$1" --json)

# Extract unique app names from the JSON
APP_NAMES=$(echo "$APPS_JSON" | jq -r '.[].["app-name"]' | sort -u)

# Loop through each unique app name
while IFS= read -r app_name; do
  if [ -n "$app_name" ]; then
    # Get the icon for this app
    icon_map "$app_name"
    icons+="$icon_result "
  fi
done <<< "$APP_NAMES"

# Get the monitor for this workspace
monitor=$(echo "$APPS_JSON" | jq -r '.[0].["monitor-appkit-nsscreen-screens-id"] // empty' | head -n 1)
if [ -z "$monitor" ]; then
  monitor="1"
fi

# Trim trailing spaces
icons=$(echo "$icons" | sed 's/ *$//')

if [ -z "$icons" ]; then
  # If the workspace is empty
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" \
      display="$monitor" \
      drawing=on \
      label.drawing=off \
      background.drawing=on \
      background.color="$BAR_COLOR"
  else
    sketchybar --set "$NAME" drawing=on label.drawing=off background.drawing=off
  fi
else
  # If the workspace has icons
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --animate sin 10 \
      --set "$NAME" \
      y_offset=10 y_offset=0 \
      background.drawing=on
  fi
  sketchybar --set "$NAME" \
    display="$monitor" \
    drawing=on \
    label="$icons" \
    label.drawing=on \
    label.font="sketchybar-app-font:Regular:14.0" \
    label.color="$LABEL_COLOR" \
    background.color="$BAR_COLOR"
fi









# # make sure it's executable with:
# # chmod +x ~/.config/sketchybar/plugins/aerospace.sh
# source "$CONFIG_DIR/colors.sh"
#
# FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused --format "%{workspace}")
#
# if [ "$SENDER" == "mouse.entered" ]; then
#   if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#     exit 0
#   fi
#   sketchybar --set "$NAME" \
#     background.drawing=on \
#     label.color="$LABEL_COLOR" \
#     background.color="$PURE_BLACK"
#   exit 0
# fi
#
# if [ "$SENDER" == "mouse.exited" ]; then
#   if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#     exit 0
#   fi
#   sketchybar --set "$NAME" \
#     background.drawing=off \
#     label.color="$LABEL_COLOR" \
#     background.color="$PURE_BLACK"
#   exit 0
# fi
#
# icons=""
#
# APPS_INFO=$(aerospace list-windows --workspace "$1" --json --format "%{monitor-appkit-nsscreen-screens-id}%{app-name}")
#
# IFS=$'\n'
# for sid in $(echo "$APPS_INFO" | jq -r "map ( .\"app-name\" ) | .[]"); do
#   icons+=$sid
#   icons+=" "
# done
#
# for monitor_id in $(echo "$APPS_INFO" | jq -r "map ( .\"monitor-appkit-nsscreen-screens-id\" ) | .[]"); do
#   monitor=$monitor_id
# done
#
# if [ -z "$monitor" ]; then
#   monitor="1"
# fi
#
# # When icons is empty, set it to " "
# if [ -z "$icons" ]; then
#   if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#     sketchybar --animate sin 10 \
#       --set "$NAME" \
#       y_offset=10 y_offset=0 \
#       background.drawing=on
#
#     sketchybar --set "$NAME" \
#       display="$monitor" \
#       drawing=on \
#       label="$icons" \
#       label.color="$LABEL_COLOR" \
#       background.color="$BAR_COLOR"
#   else
#     sketchybar --set "$NAME" drawing=off
#   fi
# else
#   if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#     sketchybar --animate sin 10 \
#       --set "$NAME" \
#       y_offset=10 y_offset=0 \
#       background.drawing=on
#
#     sketchybar --set "$NAME" \
#       display="$monitor" \
#       drawing=on \
#       label="$icons" \
#       label.color="$LABEL_COLOR" \
#       icon.font.size=14 \
#       background.color="$BAR_COLOR"
#   else
#     sketchybar --set "$NAME" \
#       display="$monitor" \
#       drawing=on \
#       label="$icons" \
#       background.drawing=off \
#       label.color="$LABEL_COLOR" \
#       icon.font.size=14 \
#       background.color="$BACKGROUND_1"
#   fi
# fi
