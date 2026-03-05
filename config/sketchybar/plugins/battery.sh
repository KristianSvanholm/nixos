#!/bin/bash
GREEN=0xff98971a
RED=0xffcc241d
CHARGING=""
BAT_LOW=""
BAT=""

PCT="$(pmset -g batt | grep -Eo "\d+%" | head -1)"
AC="$(pmset -g batt | grep -c "AC Power")"

if [ "$AC" -gt 0 ]; then
  sketchybar --set "$NAME" icon="$CHARGING" icon.color="$GREEN" label="$PCT"
elif [ "${PCT%%%}" -le 20 ]; then
  sketchybar --set "$NAME" icon="$BAT_LOW" icon.color="$RED" label="$PCT"
else
  sketchybar --set "$NAME" icon="$BAT" icon.color="$GREEN" label="$PCT"
fi
