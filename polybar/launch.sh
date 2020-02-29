#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#MONITOR=$(cat /home/julienvallee/.mainscreen)
MONITOR="eDP-1"
for enabled_screen in $(mons | awk -F ' ' '/enabled/{ print $2 }')
do
  if [[ $enabled_screen =~ "DP-" ]]; then
    MONITOR="$enabled_screen"
  fi
done
export MONITOR

logger -t "monitor-hotplug" "restarting polybar on screen $MONITOR"
# Launch bar1
polybar bar1 &

