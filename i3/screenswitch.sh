#!/usr/bin/env bash
# Screen Controls

for screen in $(mons)
do
  if [[ $screen =~ "DP-" ]]; then
    MONITOR="$screen"
  fi
done

case $1 in
  laptop)
    # Laptop mode, internal screen only
    mons -o --primary "eDP-1" 
    ;;
  desktop)
    # Desktop mode, laptop on the left, primary is desktop screen
    mons -e left --primary "$MONITOR"
    ;;
  desktop-only)
    # Desktop mode, only desktop screen
    mons -o --primary "$MONITOR"
    ;;
esac

$HOME/.config/polybar/launch.sh
