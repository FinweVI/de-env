#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ -f /home/julienvallee/.mainscreen ]; then
    MONITOR=$(cat /home/julienvallee/.mainscreen)
    if xrandr -q | egrep "^$MONITOR connected .*$"; then
        export MONITOR=$MONITOR
    else
        export MONITOR="eDP-1"
    fi
fi

logger -t "monitor-hotplug" "restarting polybar on screen $MONITOR"
# Launch bar1
polybar bar1 &

