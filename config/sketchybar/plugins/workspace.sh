#!/bin/bash
# Workspace plugin for aerospace integration
# Three states: focused (filled), visible (border), hidden (dim)

SID="$1"
FOCUSED="$FOCUSED_WORKSPACE"
VISIBLE="$(aerospace list-workspaces --monitor all --visible)"

if [ "$SID" = "$FOCUSED" ]; then
  sketchybar --set "$NAME" background.drawing=on background.color=0xff504945 \
    background.border_width=0 icon.color=0xffebdbb2
elif echo "$VISIBLE" | grep -qx "$SID"; then
  sketchybar --set "$NAME" background.drawing=on background.color=0x00000000 \
    background.border_color=0xff504945 background.border_width=2 icon.color=0xffebdbb2
else
  sketchybar --set "$NAME" background.drawing=off background.border_width=0 \
    icon.color=0xff928374
fi
