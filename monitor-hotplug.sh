#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/julienvallee/.Xauthority

MONITOR="eDP-1"

logger -t "monitor-hotplug" "Monitor Hotplug detected, will process..."

autorandr --change
setup=$(xrandr -q | grep -v "disconnected" | grep -v "eDP-1" | grep "connected" | grep "DP-1")

if [ $? -eq 0 ]; then
    MONITOR="DP-1"
fi

logger -t "monitor-hotplug" "using $MONITOR as the new main monitor, now restarting polybar..."

echo "$MONITOR" > /home/julienvallee/.mainscreen
i3-msg restart || true
